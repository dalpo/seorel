source 'https://rubygems.org'

# Declare your gem's dependencies in seorel.gemspec.
# Bundler will treat runtime dependencies like base dependencies, and
# development dependencies will be added by default to the :development group.
gemspec

# jquery-rails is used by the dummy application
# gem "jquery-rails"

# Declare any dependencies that are still in development here instead of in
# your gemspec. These might include edge Rails or gems from your path or
# Git. Remember to move these dependencies to your gemspec before releasing
# your gem to rubygems.org.

group :debug do
  gem 'awesome_print', require: 'ap'
  gem 'pry-byebug'
  gem 'yard'
end

group :test do
  gem 'rubocop', '~> 0.50'
  gem 'simplecov', '>= 0.9', require: false
end
