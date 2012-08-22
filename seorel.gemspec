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
  s.summary     = "Seorel: SEO Meta tags plugin for Ruby on Rails"
  s.description = "Seorel: SEO Meta tags plugin for Ruby on Rails"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.8"
  # s.add_dependency "jquery-rails"

  s.add_development_dependency "sqlite3"
end
