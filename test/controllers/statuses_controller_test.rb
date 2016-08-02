require 'test_helper'

class StatusesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @status = statuses(:one)
  end

  test "should get index" do
    get statuses_url
    assert_response :success
  end

  test "should be logged in to get new" do
    get new_status_url
    assert_response :redirect
    assert_redirected_to login_path
  end

  test "should be able to get new if logged in" do
    sign_in users(:RandomUser)
    get new_status_url
    assert_response :success
  end

  test "should be logged in to post status" do
    post statuses_url, params: { status: { content: "Tessst content" } }
    assert_response :redirect
    assert_redirected_to login_path
  end

  test "should be able to create status if logged in" do
    sign_in users(:RandomUser)
    assert_difference('Status.count') do
      post statuses_url, params: { status: { content: @status.content } }
    end

    assert_redirected_to status_url(Status.last)
  end

  test "should show status" do
    get status_url(@status)
    assert_response :success
  end

  test "should be logged in to get edit" do
    get edit_status_url(@status)
    assert_response :redirect
    assert_redirected_to login_path
  end

  test "should be able to get edit when logged in" do
    sign_in users(:RandomUser)
    get edit_status_url(@status)
    assert_response :success
  end

  test "should be logged in to update status" do
    patch status_url(@status), params: { status: { content: @status.content } }
    assert_response :redirect
    assert_redirected_to login_path
  end

  test "should be able to update status if logged in" do
    sign_in users(:RandomUser)
    patch status_url(@status), params: { status: { content: @status.content } }
    assert_redirected_to status_url(@status)
  end

  test "should be logged in to destroy status" do
    assert_difference('Status.count', 0) do
      delete status_url(@status)
    end

    assert_redirected_to login_path
  end

  test "should be able to destroy status if logged in" do
    sign_in users(:RandomUser)
    assert_difference('Status.count', -1) do
      delete status_url(@status)
    end

    assert_redirected_to statuses_url
  end
end
