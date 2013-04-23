require 'new_relic/agent/instrumentation/controller_instrumentation'

DependencyDetection.defer do
  depends_on do
    defined?(::Padrino)
  end

  executes do
    Padrino::Application.class_eval do
      include PadrinoRpm::Instrumentation::Padrino
    end
  end
end

module PadrinoRpm
  module Instrumentation
    module Padrino
      include NewRelic::Agent::Instrumentation::ControllerInstrumentation

      def dispatch!(*args, &block)
        found_route = self.class.compiled_router.recognize(request.env)
        found_route = found_route[0] if found_route[0].is_a?(Array)

        if found_route && found_route.first
          params = found_route.first.params
          found_route = found_route.first.path.route
          controller = found_route.controller.to_s
          short_name = found_route.name.to_s.gsub(/^#{controller}_/, '')
        else
          # Fallback based on path
          parts = request.path.split('/')
          parts.shift
          controller = parts.shift
          short_name = parts.join('_') || 'index'
        end

        perform_action_with_newrelic_trace(:category => :controller, :name => short_name, :params => request.params, :class_name => controller)  do
          dispatch_without_newrelic#(*args, &block) # RPM loads the sinatra plugin too eagerly
        end
      end

    end #PadrinoRpm::Instrumentation::Padrino
  end
end

DependencyDetection.detect!
