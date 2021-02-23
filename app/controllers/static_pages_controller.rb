class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @micropost = current_user.microposts.build if logged_in?
      @comment = Comment.new
      @feed_items = current_user.feed.paginate(page: params[:page])
      @reaction= Reaction.new
    end
  end

  def help
  end

  def about
  end

  def contact
  end
  
end
