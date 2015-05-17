require 'test_helper'

class ChapterTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should return user from chapter" do
    chapter = chapters(:one)
    assert_equal chapter.user, users(:one)
  end

  test "should return user from upload" do
    chapter = chapters(:two)
    assert_equal chapter.user, users(:two)
  end
end
