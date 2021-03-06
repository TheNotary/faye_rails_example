## About

This is a demo showing how to configure faye to run in your rails app as middlware.  

You can see a live demo of this repo on heroku at [faye-rails-example.herokuapp.com](https://faye-rails-example.herokuapp.com)


## Integration

1.  Add faye and thin to the `Gemfile`

        gem 'faye'
        gem 'thin'

2.  Add a line to `config/application.rb` to use faye middleware (also add to config.ru, heroku may look there)

        config.middleware.use Faye::RackAdapter, :mount => '/faye', :timeout => 25

3.  Put any middleware extensions you'd like into the `app/middleware` folder

4.  Run the server in production with `rails s -e production` (you can't use faye in development because some development middleware breaks faye)

Note:  To allow the rails app to server static assets in production without the need for a proxy, config/environments/production.rb was tweaked.

## References

* http://stackoverflow.com/questions/3428343/where-do-you-put-your-rack-middleware-files-and-requires
* http://guides.rubyonrails.org/rails_on_rack.html
* http://faye.jcoglan.com/ruby.html
