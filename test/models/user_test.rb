require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "default user should not be admin" do
    user = User.new

    assert !user.admin?, "New user was set as admin"
  end
end
