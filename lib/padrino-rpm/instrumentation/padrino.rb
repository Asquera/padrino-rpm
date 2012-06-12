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
        if @route
          name = @route.as_options[:name]
          short_name = name.to_s.split(/_/).last
          controller = @route.controller
        end
        
        perform_action_with_newrelic_trace(:category => :controller, :name => short_name, :params => request.params, :class_name => controller)  do
          dispatch_without_newrelic#(*args, &block) # RPM loads the sinatra plugin too eagerly
        end
      end

    end #PadrinoRpm::Instrumentation::Padrino
  end
end

DependencyDetection.detect!
