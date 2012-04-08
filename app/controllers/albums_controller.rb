class AlbumsController < ApplicationController

  before_filter :authenticate_user!
  before_filter :user_must_be

  # GET /albums
  # GET /albums.json
  def index
    @albums = Album.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @albums }
    end
  end

  # GET /albums/1
  # GET /albums/1.json
  def show
    @album = Album.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @album }
    end
  end

  # GET /albums/new
  # GET /albums/new.json
  def new
    @album = Album.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @album }
    end
  end

  # GET /albums/1/edit
  def edit
    @album = Album.find(params[:id])
  end

  # POST /albums
  # POST /albums.json
  def create
    @album = Album.new(params[:album])
    saved = @album.save

    params[:foto].each do |idFoto|
      foto = Foto.find_by_id(idFoto);

      foto.update_attributes(:album_id => @album.id)
      #@album.fotos.create( foto.attributes ) 
    end    

    respond_to do |format|
      if saved
        format.html { redirect_to @album, notice: 'Album was successfully created.' }
        format.json { render json: @album, status: :created, location: @album }
      else
        format.html { render action: "new" }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /albums/1
  # PUT /albums/1.json
  def update
    @album = Album.find(params[:id])

    if(params[:foto] != nil)
      fotos = Foto.find_all_by_album_id(@album.id)
      fotos.each do |fotoExistente|
        if (!params[:foto][fotoExistente.id] )    
          fotoExistente.update_attributes(:album_id => nil)        
        end
      end

      params[:foto].each do |idFoto|
        foto = Foto.find_by_id(idFoto);
        foto.update_attributes(:album_id => @album.id)
        #@album.fotos.create( foto.attributes ) 
      end  
    else
      fotos = Foto.find_all_by_album_id(@album.id)
      fotos.each do |fotoExistente|   
        fotoExistente.update_attributes(:album_id => nil)     
      end

    end

    respond_to do |format|
      if @album.update_attributes(params[:album])
        format.html { redirect_to @album, notice: 'Album was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /albums/1
  # DELETE /albums/1.json
  def destroy
    @album = Album.find(params[:id])
    @album.destroy

    respond_to do |format|
      format.html { redirect_to albums_url }
      format.json { head :ok }
    end
  end
end
