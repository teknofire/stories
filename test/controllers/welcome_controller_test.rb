require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end

  test 'renders welcome index' do
    get :index

    assert_response :success
  end
end
