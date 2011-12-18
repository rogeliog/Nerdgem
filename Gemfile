source 'http://rubygems.org'
source "http://gems.github.com/"

#Rails
gem 'rails', '>=3.1.0rc6'

#Application
gem 'devise'
gem 'omniauth'
gem 'rake', '0.9.2'
gem 'cancan'
gem 'carrierwave'
gem 'mini_magick'

#Form formatting and code syntax
gem 'redcarpet'
gem 'albino'
gem 'nokogiri'
gem "acts_as_markup"
gem 'pygmentize'

# Rails 3.1 - Asset Pipeline
gem 'json'
gem 'sass'
gem 'coffee-script'
gem 'uglifier'
gem 'sprockets'

gem 'haml'

# Rails 3.1 - JavaScript
gem 'jquery-rails'

gem 'rest-client'

group :production do
  gem 'pg'
  gem 'thin'
end

group :development, :test do 
  # Database 
  gem 'sqlite3', '>=1.3.4'
  
  # Testing suite
  gem 'capybara',">= 1.0.0"
  gem 'timecop'
  gem 'rspec-rails'
  gem 'database_cleaner'
  gem 'fuubar'
  gem "spork", "> 0.9.0.rc"
  gem "guard-spork"
  gem "guard-rspec"
  gem 'growl_notify'
  gem 'rb-fsevent', :require => false if RUBY_PLATFORM =~ /darwin/i
  gem 'factory_girl_rails'
  gem 'launchy'
  gem "selenium-client"

  #Extras
  gem 'linecache19'
  gem 'nifty-generators'
  gem 'jquery-rails'
  gem "ruby-debug19"

end

gem "mocha", :group => :test
