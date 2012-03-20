class IndexController < ApplicationController
  def home
  	@last_posts = Post.limit(5).order("created_at DESC").find(:all)
  end

end
