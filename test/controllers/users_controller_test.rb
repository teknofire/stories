require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
  setup do
    login_user(users(:one))
    @user = users(:one)
  end


  test "should render index" do
    get :index

    assert_response :success
  end

  test 'should render show' do
    get :show, id: @user
  end

  test 'should render update action' do
    get :update, id: @user, user: { name: 'Testing' }

    assert_redirected_to @user
  end

  test 'should render edit action' do
    get :edit, id: @user

    assert_response :success
  end
end
