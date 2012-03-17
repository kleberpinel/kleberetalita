class PostsController < ApplicationController

  before_filter :authenticate_user!
  before_filter :user_must_be

  def user_must_be
    if user_signed_in?
      if current_user.email != "kleberpinel@gmail.com" && current_user.email != "talita_sack@hotmail.com"
        flash[:error] = "Seu usuario nao tem premissao para acessar esta area do site!"
        redirect_to index_home_url # halts request cycle
      end 
    end
  end

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = Post.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
    @categorias = Categoria.find(:all)
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(params[:post])

    savePictures
    
    @post.data = Time.new
    
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, :notice => 'Post was successfully created.' }
        format.json { render :json => @post, :status => :created, :location => @post }
      else
        format.html { render :action => "new" }
        format.json { render :json => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    logger.debug params.inspect

    @post = Post.find(params[:id])

    savePictures
    @post.categoria_id = params[:categoria]

    @post.data = Time.new

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to @post, :notice => 'Post was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :ok }
    end
  end

  def savePictures
    #AWS::S3::Base.establish_connection!( :access_key_id => ENV['S3_KEY'], :secret_access_key => ENV['S3_SECRET'])
    AWS::S3::Base.establish_connection!( :access_key_id => 'AKIAJ7ZNS42OYFZPC3LA', :secret_access_key => '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')
    
    pic1 = params[:post][:picture1]
    if pic1
      @post.picture1 = "https://s3.amazonaws.com/rails_s3/" << params[:post][:titulo].to_s.gsub(" ", "_") << "1.jpg"
      AWS::S3::S3Object.store(params[:post][:titulo].to_s.gsub(" ", "_") << "1.jpg", open(pic1.tempfile.path) , 'rails_s3', :access => :public_read)
    end

    pic2 = params[:post][:picture2]
    if pic2
      @post.picture2 = "https://s3.amazonaws.com/rails_s3/" << params[:post][:titulo].to_s.gsub(" ", "_") << "2.jpg"
      AWS::S3::S3Object.store(params[:post][:titulo].to_s.gsub(" ", "_") << "2.jpg", open(pic2.tempfile.path) , 'rails_s3', :access => :public_read)
    end

    pic3 = params[:post][:picture3]
    if pic3
      @post.picture3 = "https://s3.amazonaws.com/rails_s3/" << params[:post][:titulo].to_s.gsub(" ", "_") << "3.jpg"
      AWS::S3::S3Object.store(params[:post][:titulo].to_s.gsub(" ", "_") << "3.jpg", open(pic3.tempfile.path) , 'rails_s3', :access => :public_read)
    end
  end
 
end
