source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.4.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 8.1.3', '>= 8.1.3.1'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '>= 5.6.8'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem 'rack-cors'

gem 'nokogiri', '>= 1.14.3'
gem 'rack', '>= 2.2.8.1'
gem 'rexml', '>= 3.2.7'
gem 'concurrent-ruby', '>= 1.3.7'
gem 'websocket-driver', '>= 0.8.1'
gem 'loofah', '>= 2.25.2'
gem 'rails-html-sanitizer', '>= 1.7.1'
gem 'msgpack', '>= 1.8.2'
gem 'mail', '>= 2.9.1'
gem 'json', '~> 2.21'

group :development, :test do
  gem 'rubocop'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'listen'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen'
end

group :test do
  gem 'minitest', '~> 5.25'
  gem 'shoulda-context'
  gem 'shoulda-matchers'
  gem 'rails-controller-testing'
  gem 'code-scanning-rubocop'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
