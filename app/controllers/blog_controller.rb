class BlogController < ApplicationController
  def list
  	@blog_name = "Malandrão.... não tem blog pra vc não !!! heay heay !"
  	if params[:user] == "kleber"
      @blog_name = "Blog do Kleber"
    elsif params[:user] == "talita"
      @blog_name = "Blog da talita"
    elsif params[:user] == "nois"
      @blog_name = "Blog do Kleber e da Talita - Nossas postagens Toguether"
    end
  end

end
