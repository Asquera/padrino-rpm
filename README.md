## padrino-rpm: Padrino instrumentation for New Relic RPM

Still in the works, but easy to install if you want to try. Add the following to your Gemfile:

    gem 'padrino' # Padrino needs to be loaded first!
    gem 'padrino-rpm'
    
Run `bundle install` and add a newrelic.yml to your project:

    newrelic install "my-app-name"

If you are running your Padrino application on Heroku's Bamboo stack, running "newrelic install" is not necessary because Heroku adds newrelic.yml on your behalf.


## Unicorn

If you are using unicorn, make sure that you read the following: http://newrelic.com/docs/troubleshooting/im-using-unicorn-and-i-dont-see-any-data

## Word of warning

At the moment, this works for me. Any additions are welcome.
