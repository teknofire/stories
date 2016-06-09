require 'test_helper'

class UploadsControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
  setup do
    login_user(users(:two))
    @upload = uploads(:one)
  end

  test "should not be able to see uploads" do
    login_user(nil)
    get :index
    assert_response :redirect
  end

  # test "should create upload" do
  #   assert_difference('Upload.count') do
  #     post :create, upload: { file: 'test' }
  #   end
  #
  #   assert_redirected_to upload_path(assigns(:upload))
  # end

  test "should delete upload" do
    assert_difference('Upload.count', -1) do
      delete :destroy, id: uploads(:one).id
    end

    assert_redirected_to uploads_path
  end

  test "should show index of uploads" do
    get :index

    assert_not_nil assigns(:uploads)
    assert_response :success
  end

  test "should show upload" do
    get :show, id: @upload.id

    assert_not_nil assigns(:upload)
    assert_response :success
  end

  test "should show new upload form" do
    get :new

    assert_not_nil assigns(:upload)
    assert_response :success
  end

  test "should not be able to retry upload" do
    patch :retry, id: @upload.id

    assert_match /Unable/, flash[:notice]
    assert_redirected_to @upload
  end

  test "should be able to retry errored upload" do
    patch :retry, id: uploads(:error)

    assert_match /requeued/, flash[:notice]
    assert_redirected_to uploads(:error)
  end
end
