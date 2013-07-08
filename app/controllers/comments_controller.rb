class CommentsController < ApplicationController
	def create

		logger.debug params[:comment].to_s << "---------------"

		@post = Post.find(params[:post_id])
		@comment = @post.comments.create(params[:comment])
		redirect_to view_blog_path(@post)
	end

	def destroy
		@post = Post.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
		@comment.destroy
		redirect_to post_path(@post)
	end

	def show
	    @post = Post.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
	    logger.info @comment.inspect
	  end

	  def edit
	    @post = Post.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
	    logger.info @comment.inspect
	  end

	  def update
	  	@post = Post.find(params[:post_id])
	    @comment = Comment.find(params[:id])
	    @comment.update_attributes(params[:comment])
	    redirect_to @post

	  	
	  end
end