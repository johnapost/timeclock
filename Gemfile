source 'https://rubygems.org'

ruby '2.1.2'
gem 'rails', '4.1.4'

gem 'haml' # Faster HTML
gem 'haml-rails' # Generate HAML templates
gem 'mysql2' # SQL DB
gem 'unicorn' # Concurrent server

gem 'bootstrap-sass' # Bootstrap
gem 'autoprefixer-rails' # Automatic vendor prefixes
gem 'momentjs-rails' # JS time and date formatter
gem 'execjs' # Execute JS
gem 'therubyracer' # V8 JS interpreter
gem 'jquery-rails' # jQuery
gem 'jquery-ui-rails' # jQuery UI
gem 'turbolinks' # Push state content
gem 'simple_form' # Form generation
gem 'devise' # User modeling
gem 'annotate' # Annotate models
gem 'sass-rails' # SASS support
gem 'coffee-rails' # CoffeeScript support
gem 'uglifier' # JS compression
gem 'yui-compressor' # CSS/JS compression
gem 'prawn' # PDF generation

group :development do
  gem 'better_errors' # Ruby errors
  gem 'binding_of_caller' # Deeper errors
  gem 'rails-erd' # Visualize models
  gem 'quiet_assets' # Mute asset messages in console
  gem 'spring' # Fork dev server
  gem 'spring-commands-cucumber' # Spring for Cucumber
  gem 'spring-commands-rspec' # Spring for RSpec
end

group :test do
  gem 'cucumber-rails', require:false # Acceptance tests
  gem 'rspec-rails' # Unit tests
  gem 'factory_girl_rails' # Factories for tests
  gem 'faker' # Create fake data
  gem 'capybara' # Simulate user
  gem 'poltergeist' # Simulate browser JS
  gem 'database_cleaner' # Clean test db
  gem 'simplecov' # See test coverage
  gem 'guard' # Watch project directory
  gem 'guard-livereload' # Reload page on save
  gem 'guard-cucumber' # Run features on save
  gem 'guard-rspec' # Run specs on save
  gem 'rb-fsevent' # Detect file changes
  gem 'pdf-reader' # Convert PDFs to be readable by Poltergeist
end

group :doc do
  gem 'sdoc', require: false # RDoc generator to build searchable HTML for Ruby
end