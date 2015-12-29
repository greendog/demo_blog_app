$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "front_office/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "front_office"
  s.version     = FrontOffice::VERSION
  s.authors     = ["Alexander Negoda"]
  s.email       = ["alexander.negoda@gmail.com"]
  s.homepage    = "http://blog-app.com"
  s.summary     = "Functionality is available for anonymous users"
  s.description = "Public part of the application"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.5"

  s.add_development_dependency 'combustion'
end
