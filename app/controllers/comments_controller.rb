class CommentsController < ApplicationController
	def create
		logger.debug "ooooooooooooooooooooooooooo"

	    @post = Post.find(params[:post_id])
	    @comment = @post.comments.create(params[:comment])
	    redirect_to post_path(@post)
	  end
end
