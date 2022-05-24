source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.5'

gem 'rails', '~> 5.2.3'

# Application server
gem 'puma', '~> 3.11'

# Database server
gem 'mysql2', '~> 0.5.3'

#UI/UX
gem 'jbuilder', '~> 2.5'
gem 'slim-rails'
gem 'meta-tags'
gem 'fullcalendar-rails', '~> 3.9'
gem 'momentjs-rails', '~> 2.20', '>= 2.20.1'
gem 'rails-i18n', '~> 5.1', '>= 5.1.3'
gem 'flatpickr', '~> 4.6', '>= 4.6.11.0'

#Assets
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'bootstrap', '~> 4.5.0'
gem 'font-awesome-rails'
gem 'font-awesome-sass', '~> 5.4.1'
gem 'jquery-rails'

group :development, :test do
  #Debugger
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'pry-byebug'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'pry'
  gem 'pry-doc'
  gem 'pry-rails'

  #Test
  gem 'factory_bot_rails'
  gem 'rspec-rails'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end


gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
