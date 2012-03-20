class BlogController < ApplicationController
  
  def list
    @posts = Post.find_all_by_autor(params[:user])
  	if params[:user] == "Kleber"
      @blog_name = "Blog do Kleber"
    elsif params[:user] == "Talita"
      @blog_name = "Blog da Talita"
    else
      @blog_name = "Blog do Kleber e da Talita - Nossas postagens Together"
      @posts = Post.find(:all)
    end

    @last_coments = Comment.limit(5).order("created_at DESC").find(:all)

  end

  def view
    if params[:user] == "Kleber"
      @blog_name = "Blog do Kleber"
    elsif params[:user] == "Talita"
      @blog_name = "Blog da Talita"
    else
      @blog_name = "Blog do Kleber e da Talita - Nossas postagens Together"
    end

    @post = Post.find(params[:id])
    @blog_name = @post.autor

    @last_coments = Comment.limit(3).order("created_at DESC").find(:all)
    @posts = Post.find(:all)
  end

end
