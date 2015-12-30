# Requirements

- Ruby 2.2.3
- bundler
- ElasticSearch


# Use it as:

1. ```git clone https://github.com/greendog/demo_blog_app.git```
2. ```cd demo_blog_app```
3. ```bundle install```
4. ```bundle exec rake db:install``` for install with demo data or ```bundle exec rake db:migrate``` -  without demo data
5. ```bundle exec rails s```
6. go to http://localhost:3000