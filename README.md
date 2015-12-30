# Requirements

- Ruby 2.2.3
- bundler
- ElasticSearch


# Use it as:

1. ```git clone https://github.com/greendog/demo_blog_app.git```
2. ```cd demo_blog_app```
3. ```bundle install```
4. ```bundle exec rake db:install``` for install with demo data and ```admin``` user or ```bundle exec rake db:migrate``` -  without demo data and admin
5. ```bundle exec rails s```
6. go to http://localhost:3000 (here you can create an administrator account if it is not: http://localhost:3000/users/sign_up)
7. go to http://localhost:3000/letter_opener to confirm admin account
8. go to http://localhost:3000/admin ```admin@example.com/password```