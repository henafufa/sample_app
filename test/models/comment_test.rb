require "test_helper"

class CommentTest < ActiveSupport::TestCase
  def setup
    @user = users(:michael)
    @micropost = microposts(:orange)
    @comment = Comment.new(content: "Lorem ipsum", user_id: @user.id, micropost_id: @micropost.id)
    @comment = @user.comments.build(content: "Lorem ipsum",micropost_id: @micropost.id)
  end

  test "should be valid" do
    assert @comment.valid?
  end

  test "user id should be present" do
    @comment.user_id = nil
    assert_not @comment.valid?
  end

  test "micropost id should be present" do
    @comment.micropost_id = nil
    assert_not @comment.valid?
  end

  test "content should be present" do
    @comment.content = nil
    assert_not @comment.valid?
  end

  test "content should be at most 140 characters" do
    @micropost.content = "a" * 141
    assert_not @micropost.valid?
  end

  test "order should be most recent first" do
    assert_equal comments(:rat_comment), Comment.first
  end
end
