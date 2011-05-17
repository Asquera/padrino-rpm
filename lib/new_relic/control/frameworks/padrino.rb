require 'new_relic/control/frameworks/ruby'

module NewRelic::Control::Frameworks #:nodoc:
  class Padrino < NewRelic::Control::Frameworks::Ruby
    def init_config(options)
      super
      self['app_name'] ||= 'Padrino Application'
    end
  end
end