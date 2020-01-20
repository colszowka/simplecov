# frozen_string_literal: true

source "https://rubygems.org"

# Uncomment this to use local copy of simplecov-html in development when checked out
# gem "simplecov-html", path: File.dirname(__FILE__) + "/../simplecov-html"

# Uncomment this to use development version of html formatter from github
# gem "simplecov-html", github: "colszowka/simplecov-html"

group :development do
  gem "apparition", github: "twalpole/apparition"
  gem "aruba", github: "cucumber/aruba"
  gem "capybara", github: "teamcapybara/capybara"
  gem "cucumber", "~> 3.1"
  gem "rake", "~> 13.0"
  gem "rspec", "~> 3.2"
  gem "pry"
  gem "rubocop"
  gem "test-unit"
end

group :benchmark do
  gem "benchmark-ips"
end

gemspec
