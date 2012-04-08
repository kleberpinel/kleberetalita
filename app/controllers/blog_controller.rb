class BlogController < ApplicationController
  
  def list
    autor = Autor.find_by_id(params[:id_autor])
    
    if autor != nil
      @posts = Post.where( :autor_id =>  autor, :publicado => true).paginate(:page => params[:page], :per_page => 5)
      @blog_name = autor.titulo_blog
    else
      @posts = Post.where( :publicado => true).paginate(:page => params[:page], :per_page => 5)
      @blog_name = "Blog de autor inexistente!... Visualizando todos os Posts!"
    end

    @last_coments = Comment.limit(5).order("created_at DESC").find(:all)

  end

  def category
    categoria = Categoria.find_by_id(params[:id])
    @blog_name = "Voce procurou pela categoria '" << categoria.nome << "'"
    @posts = Post.where( :categoria_id =>  categoria, :publicado => true).paginate(:page => params[:page], :per_page => 5)
   
    @last_coments = Comment.limit(5).order("created_at DESC").find(:all)

    render "list"

  end

  def view
    logger.debug params[:id].inspect
    @post = Post.find(params[:id])
    @blog_name = @post.autor.titulo_blog

    @last_coments = Comment.joins(:post).where(:posts => {:autor_id => @post.autor.id}).limit(3).order("created_at DESC")
    @posts = Post.find(:all)
  end

end
