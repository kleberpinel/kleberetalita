class IndexController < ApplicationController
  def home
  	@error_msg = params[:error_msg]
  	@last_posts = Post.limit(5).order("created_at DESC").find(:all)
  end

end
