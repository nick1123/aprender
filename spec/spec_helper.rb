ENV["RAILS_ENV"] = 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'factory_girl_rails'
require 'rspec/autorun'
require 'ostruct'

# Requires spec support files
Dir[File.join(Rails.root, "spec", "support/**/*.rb")].each { |f| require f }

