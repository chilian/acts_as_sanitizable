TEST_DIR = File.dirname(__FILE__)

require 'rubygems'
require 'bundler/setup'
require 'yaml'
require 'factory_girl'
require 'rails/all'


#Bundler.setup

ActiveRecord::Base.configurations = YAML.load_file("#{TEST_DIR}/db/database.yml")
ActiveRecord::Base.establish_connection(:sqlite3mem)
ActiveRecord::Migration.verbose = false

require 'acts_as_sanitizable'
require 'support/user' # user model for testing
Dir["#{TEST_DIR}/factories/*.rb"].each { |file| require file }
require 'rspec/rails'

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods

  config.before :suite do
    I18n.enforce_available_locales = true
    load "#{TEST_DIR}/db/schema.rb"
  end
end