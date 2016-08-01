require 'test_helper'

class ProfilesControllerTest < ActionDispatch::IntegrationTest
  
  test "should get show" do
    get profiles_show_url, params: { id: users(:RandomUser).profile_name }
    assert_response :success
    assert_template 'profiles/show'
  end

  test "should render 404 if profile does not exist" do
  	get profiles_show_url, params: { id: "doesn't exist" }
  	assert_response :not_found
  end

end
