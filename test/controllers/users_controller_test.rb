require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
  setup do
    login_user(users(:one))
  end


  test "should render index" do
    get :index

    assert_response :success
  end
end
