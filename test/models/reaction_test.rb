require "test_helper"

class ReactionTest < ActiveSupport::TestCase
  def setup
    @user = users(:michael)
    @micropost = microposts(:orange)
    @reaction = Reaction.new(user_id: @user.id, micropost_id: @micropost.id)
  end

  test "should be valid" do
    assert @reaction.valid?
  end

  test "user id should be present" do
    @reaction.user_id = nil
    assert_not @reaction.valid?
  end

  test "micropost id should be present" do
    @reaction.micropost_id = nil
    assert_not @reaction.valid?
  end

  test "order should be most recent first" do
    assert_equal microposts(:most_recent), Micropost.first
  end

  # test "associated reactions should be destroyed" do
  #   @user.save
  #   @user.reactions.create!(micropost_id: @micropost.id)
  #   assert_difference 'Reaction.count', -1 do
  #     @user.destroy
  #   end
  # end
  
end
