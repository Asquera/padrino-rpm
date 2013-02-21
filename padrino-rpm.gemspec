# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{padrino-rpm}
  
  s.version = "0.6.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Florian Gilcher"]
  s.date = %q{2011-11-19}
  s.description = %q{A gem for monitoring Padrino with newrelic rpm}
  s.email = %q{florian.gilcher@asquera.de}

  s.homepage = %q{http://github.com/Asquera/padrino-rpm}
  s.require_paths = ["lib"]
  s.summary = %q{Padrino Instrumentation for New Relic RPM}
  s.files = `git ls-files`.split("\n")

  s.add_dependency(%q<newrelic_rpm>, "~> 3.5.3")
end

