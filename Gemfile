source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.5'

gem 'rails', '~> 5.2.3'

# Application server
gem 'puma', '~> 3.11'

# Database server
gem 'mysql2', '>= 0.4.4', '< 0.6.0'

#UI/UX
gem 'jbuilder', '~> 2.5'
gem 'slim-rails'

#Assets
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'bootstrap-sass'
gem 'font-awesome-rails'
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
