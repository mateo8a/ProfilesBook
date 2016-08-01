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

  test "should assign correct variables on a user's profile page" do
  	get profiles_show_url, params: { id: users(:RandomUser).profile_name }
  	assert assigns(:user)
  	assert_not_empty assigns(:statuses)
  end

  test "should only show a user's statuses, not all statuses" do
  	get profiles_show_url, params: { id: users(:RandomUser).profile_name }
  	assigns(:statuses).each do |status|
  		assert_equal users(:RandomUser), status.user
  	end
  end

end
