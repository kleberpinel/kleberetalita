class CategoriaCotasController < ApplicationController

  before_filter :authenticate_user! , :only => [:index, :show, :new, :edit, :create, :update, :destroy]
  before_filter :user_must_be , :only => [:index, :show, :new, :edit, :create, :update, :destroy]

  # GET /categoria_cotas
  # GET /categoria_cotas.json
  def index
    @categoria_cotas = CategoriaCota.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @categoria_cotas }
    end
  end

  # GET /categoria_cotas/1
  # GET /categoria_cotas/1.json
  def show
    @categoria_cota = CategoriaCota.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @categoria_cota }
    end
  end

  # GET /categoria_cotas/new
  # GET /categoria_cotas/new.json
  def new
    @categoria_cota = CategoriaCota.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @categoria_cota }
    end
  end

  # GET /categoria_cotas/1/edit
  def edit
    @categoria_cota = CategoriaCota.find(params[:id])
  end

  # POST /categoria_cotas
  # POST /categoria_cotas.json
  def create
    @categoria_cota = CategoriaCota.new(params[:categoria_cota])

    savePictures

    respond_to do |format|
      if @categoria_cota.save
        format.html { redirect_to @categoria_cota, notice: 'Categoria cota was successfully created.' }
        format.json { render json: @categoria_cota, status: :created, location: @categoria_cota }
      else
        format.html { render action: "new" }
        format.json { render json: @categoria_cota.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /categoria_cotas/1
  # PUT /categoria_cotas/1.json
  def update
    @categoria_cota = CategoriaCota.find(params[:id])

    savePictures

    respond_to do |format|
      if @categoria_cota.update_attributes(params[:categoria_cota])
        format.html { redirect_to @categoria_cota, notice: 'Categoria cota was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @categoria_cota.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categoria_cotas/1
  # DELETE /categoria_cotas/1.json
  def destroy
    @categoria_cota = CategoriaCota.find(params[:id])
    @categoria_cota.destroy

    conect_to_s3
    AWS::S3::S3Object.delete(@categoria_cota.imagem, 'rails_s3')

    respond_to do |format|
      format.html { redirect_to categoria_cotas_url }
      format.json { head :ok }
    end
  end

  def conect_to_s3
    AWS::S3::Base.establish_connection!( :access_key_id => 'AKIAJ7ZNS42OYFZPC3LA', :secret_access_key => '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')
  end

  def savePictures
    conect_to_s3
    pic = params[:categoria_cota][:imagem]
    if pic
      @categoria_cota.imagem = params[:categoria_cota][:nome].to_s.gsub(" ", "_") << ".jpg"
      params[:categoria_cota][:imagem] = @categoria_cota.imagem
      AWS::S3::S3Object.store(params[:categoria_cota][:nome].to_s.gsub(" ", "_") << ".jpg", open(pic.tempfile.path) , 'rails_s3', :access => :public_read)
    end
  end
end
