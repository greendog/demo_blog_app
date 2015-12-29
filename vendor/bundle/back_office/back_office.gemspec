$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "back_office/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "back_office"
  s.version     = BackOffice::VERSION
  s.authors     = ["Alexander Negoda"]
  s.email       = ["alexander.negoda@gmail.com"]
  s.homepage    = "http://blogapp.com"
  s.summary     = "Blog administration functionality"
  s.description = "Blog management engine"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.5"
  s.add_dependency "activeadmin"
  s.add_development_dependency 'combustion'
end
