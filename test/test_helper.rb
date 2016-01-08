ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def assert_required_field(active_record_instance, active_record_attribute)
    active_record_instance.send("#{active_record_attribute}=", nil)
    assert_not active_record_instance.save
    assert active_record_instance.errors[active_record_attribute]
  end
end
