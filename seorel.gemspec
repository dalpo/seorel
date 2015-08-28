$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "seorel/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "seorel"
  s.version     = Seorel::VERSION
  s.authors     = ["Andrea Dal Ponte"]
  s.email       = ["info@andreadalponte.com"]
  s.homepage    = "https://github.com/dalpo/seorel"
  s.summary     = "Ruby on Rails SEO Metatags engine for ActiveRecord models"
  s.description = "Easy management of SEO Metatags for your ActiveRecord models"
  s.license     = 'MIT'

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency 'rails', '>= 3.2'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'rspec-its'
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'database_cleaner'
end
