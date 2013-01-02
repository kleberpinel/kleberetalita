class FotosController < ApplicationController

  before_filter :authenticate_user! , :only => [:create, :destroy, :new, :index, :savePictures]
  before_filter :user_must_be , :only => [:create, :destroy, :new, :index, :savePictures]

  def create

    @foto = Foto.new(params[:foto])

    savePictures

    respond_to do |format|
      if @foto.save
        format.html { redirect_to @foto, notice: 'Foto was successfully created.' }
        format.json { render json: @foto, status: :created, location: @foto }
      else
        format.html { render action: "new" }
        format.json { render json: @foto.errors, status: :unprocessable_entity }
      end
    end
    
  end

  def show
    @foto = Foto.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @foto }
    end
  end

  def destroy
    @foto = Foto.find(params[:id])

    conect_to_s3
    AWS::S3::S3Object.delete(@foto.picture, 'rails_s3')

    @foto.destroy

    respond_to do |format|
      format.html { redirect_to fotos_url }
      format.json { head :ok }
    end
  end

  def new
    @foto = Foto.new
  end

  def edit
    @foto = Foto.find(params[:id])
  end

  def update

    @foto = Foto.find(params[:id])
    
    respond_to do |format|
      if @foto.update_attributes(params[:foto])
        format.html { redirect_to @foto, :notice => 'Foto was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @foto.errors, :status => :unprocessable_entity }
      end
    end
  end

  def index
    @fotos = Foto.all
  end

  def conect_to_s3
    AWS::S3::Base.establish_connection!( :access_key_id => 'AKIAJ7ZNS42OYFZPC3LA', :secret_access_key => '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')
  end

  def savePictures
    conect_to_s3
    pic = params[:foto][:picture]
    if pic
      @foto.picture = params[:foto][:nome].to_s.gsub(" ", "_") << ".jpg"
      AWS::S3::S3Object.store(params[:foto][:nome].to_s.gsub(" ", "_") << ".jpg", open(pic.tempfile.path) , 'rails_s3', :access => :public_read)
    end
  end

  def select
    @fotos = Foto.all

    render :file => 'fotos/select_foto.html.erb', :layout => false
  end

  def selectOne
    @fotos = Foto.all
    @tipo_foto = params[:tipo_foto]

    render :file => 'fotos/select_one_foto.html.erb', :layout => false
  end
end
