TEST_DIR = File.dirname(__FILE__)

require 'rubygems'
require 'bundler/setup'
require 'yaml'
require 'rails/all'

# Bundler.setup

ActiveRecord::Base.configurations = YAML.load_file("#{TEST_DIR}/db/database.yml")
ActiveRecord::Base.establish_connection(:sqlite3mem)
ActiveRecord::Migration.verbose = false

require 'sanitizable'
require 'support/models'
require 'rspec/rails'

RSpec.configure do |config|
  config.before :suite do
    I18n.enforce_available_locales = true
    load "#{TEST_DIR}/db/schema.rb"
  end
end