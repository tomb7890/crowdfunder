require "test_helper"



class UserFlowsTest < ActionDispatch::IntegrationTest

  setup do
    @test_user_password = 'sekret'
    @test_user_email = "bob.smith@example.com"
    create(:test_user, email: @test_user_email,
                        password: @test_user_password) 

  end


  test "authentication & authorization" do
    get root_path
    assert_select "h2", "Hello World"

    get admin_path
    assert_redirected_to login_url
    s = "Please log in before trying to visit this page."
    assert_equal s, flash[:alert]

    sign_in_with( @test_user_email, @test_user_password ) 
    get admin_path
    s = "Logged in!"
    assert_equal s, flash[:notice]
  end
end
