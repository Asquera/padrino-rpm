## padrino-rpm: Padrino instrumentation for New Relic RPM

Still in the works, but easy to install if you want to try. Add the following to your Gemfile:

    gem 'padrino' # Padrino needs to be loaded first!
    gem 'padrino-rpm'
    
Run `bundle install` and add a newrelic config to your project:

    newrelic install "my-app-name"

## Word of warning

At the moment, this works for me. Any additions are welcome.
