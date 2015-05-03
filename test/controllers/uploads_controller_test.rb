require 'test_helper'

class UploadsControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
  setup do
    @upload = uploads(:one)
  end

  test "should create upload" do
    assert_difference('Upload.count') do
      post :create, upload: { file: 'test' }
    end

    assert_redirected_to upload_path(assigns(:upload))
  end

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
end
