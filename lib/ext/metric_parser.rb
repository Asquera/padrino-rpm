# NewRelics standard metric parser turns the controller
# name test into TestController. This fixes this behaviour.
module NewRelic
  module MetricParser
    class Controller < NewRelic::MetricParser::MetricParser
      def controller_name
        segments[1..-2].join('/')
      end
    end
  end
end