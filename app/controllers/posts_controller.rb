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
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(params[:post])
    
    setPictures()
    
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
    @post = Post.find(params[:id])

    pic1 = params[:post][:picture1]
    if pic1
      @post.picture1 = params[:post][:titulo].to_s.gsub(" ", "_") << "1.jpg"
      FileUtils.copy(pic1.tempfile.path, "#{Rails.root}/public/images/uploads/#{@post.picture1}")
    end
    
    pic2 = params[:post][:picture2]
    if pic2
      @post.picture2 = params[:post][:titulo].to_s.gsub(" ", "_") << "2.jpg"
      FileUtils.copy(pic2.tempfile.path, "#{Rails.root}/public/images/uploads/#{@post.picture2}")
    end

    pic3 = params[:post][:picture3]
    if pic3
      @post.picture3 = params[:post][:titulo].to_s.gsub(" ", "_") << "3.jpg"
      FileUtils.copy(pic3.tempfile.path, "#{Rails.root}/public/images/uploads/#{@post.picture3}")
    end
    @post.data = Time.new

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, :notice => 'Post was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  def setPictures
    
    
    pic2 = @post.picture2
    if pic2
      @post.picture2 = pic2.original_filename.to_s
      FileUtils.copy(pic2.tempfile.path, "#{Rails.root}/public/images/#{pic2.original_filename}")
    end 

    pic3 = @post.picture3
    if pic3
      @post.picture3 = pic3.original_filename.to_s
      FileUtils.copy(pic3.tempfile.path, "#{Rails.root}/public/images/#{pic3.original_filename}")
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
end
