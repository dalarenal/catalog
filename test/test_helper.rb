ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'factory_girl_rails'
require 'rails/test_help'
require 'support/json_schema_matcher'

class ActiveSupport::TestCase
  include FactoryGirl::Syntax::Methods
end
