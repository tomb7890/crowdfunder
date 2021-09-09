ENV['RAILS_ENV'] ||= 'test'
require_relative "../config/environment"
require "rails/test_help"

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  include FactoryBot::Syntax::Methods
end


module SignInHelper
  def sign_in_with(email, password)
    post sessions_url, params: { email: email, password: password,
                                 password_confirmation: password } 

  end
end



class ActionDispatch::IntegrationTest
  include SignInHelper
end


