# frozen_string_literal: true

source "https://rubygems.org"

# rubocop:disable Bundler/DuplicatedGem
case ENV["SIMPLECOV_HTML_MODE"]
when "local"
  # Use local copy of simplecov-html in development when checked out
  gem "simplecov-html", path: "#{File.dirname(__FILE__)}/../simplecov-html"
when "github"
  # Use development version of html formatter from github
  gem "simplecov-html", github: "simplecov-ruby/simplecov-html"
end
# rubocop:enable Bundler/DuplicatedGem

group :development do
  gem "apparition", "~> 0.6.0"
  gem "aruba", "~> 1.0"
  gem "capybara", "~> 3.31"
  gem "cucumber", "~> 4.0"
  gem "minitest"
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
