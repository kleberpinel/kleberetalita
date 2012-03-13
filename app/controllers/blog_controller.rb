class BlogController < ApplicationController
  
  def list
  	@blog_name = "Malandrao.... nao tem blog pra vc nao !!! heay heay !"
  	if params[:user] == "Kleber"
      @blog_name = "Blog do Kleber"
    elsif params[:user] == "Talita"
      @blog_name = "Blog da talita"
    elsif params[:user] == "Kleber e Talita"
      @blog_name = "Blog do Kleber e da Talita - Nossas postagens Toguether"
    end


    @posts = Post.find_all_by_autor(params[:user])
  end

  def view
    @blog_name = "Malandrao.... nao tem blog pra vc nao !!! heay heay !"
    if params[:user] == "Kleber"
      @blog_name = "Blog do Kleber"
    elsif params[:user] == "Talita"
      @blog_name = "Blog da talita"
    elsif params[:user] == "Kleber e Talita"
      @blog_name = "Blog do Kleber e da Talita - Nossas postagens Toguether"
    end

    @post = Post.find(params[:id])
    @blog_name = @post.autor
  end

end
