source 'https://rubygems.org'

ruby File.read(".ruby-version").strip

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem 'rails', '~> 5.1.1'
gem 'mysql2'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'slim'
gem 'browserify-rails'
gem 'react-rails'

group :development, :test do
  gem 'pry-rails'

  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  # gem 'selenium-webdriver'
  gem 'capybara-webkit'
  gem 'rspec-rails', '~> 3.6'
  gem 'faker'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'webmock'
  gem 'database_cleaner'
  gem 'launchy'
  gem 'rails-controller-testing'
end
