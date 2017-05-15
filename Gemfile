source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem "active_model_serializers", "~> 0.10.0"
gem "bcrypt", "~> 3.1.7"
gem "carrierwave", "~> 1.0"
gem "coffee-rails", "~> 4.2"
gem "fog-aws"
gem "font-awesome-rails"
gem "foundation-rails"
gem "haml"
gem "jbuilder", "~> 2.5"
gem "jquery-datatables-rails", "~> 3.4.0"
gem "jquery-rails"
gem "jquery-ui-rails"
gem "mini_magick"
gem "pg", "~> 0.18"
gem "puma", "~> 3.0"
gem "rails", "5.1.0"
gem "recaptcha", require: "recaptcha/rails"
gem "redcarpet"
gem "sass-rails", "~> 5.0"
gem "stripe"
gem "uglifier", ">= 1.3.0"
gem "webpacker"

group :development, :test do
  gem "dotenv-rails"
  gem "pry-rails"
  gem "rspec-rails"
end

group :development do
  gem "web-console", ">= 3.3.0"
  gem "listen", "~> 3.0.5"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]

ruby "2.4.0"
