class CotasController < ApplicationController

  before_filter :authenticate_user! , :only => [:index, :show, :new, :edit, :create, :update, :destroy]
  before_filter :user_must_be , :only => [:index, :show, :new, :edit, :create, :update, :destroy]

  # GET /cotas
  # GET /cotas.json
  def index
    @cotas = Cota.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cotas }
    end
  end

  # GET /cotas/1
  # GET /cotas/1.json
  def show
    @cota = Cota.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cota }
    end
  end

  # GET /cotas/new
  # GET /cotas/new.json
  def new
    @cota = Cota.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cota }
    end
  end

  # GET /cotas/1/edit
  def edit
    @cota = Cota.find(params[:id])
  end

  # POST /cotas
  # POST /cotas.json
  def create
    @cota = Cota.new(params[:cota])

    savePictures

    respond_to do |format|
      if @cota.save
        format.html { redirect_to @cota, notice: 'Cota was successfully created.' }
        format.json { render json: @cota, status: :created, location: @cota }
      else
        format.html { render action: "new" }
        format.json { render json: @cota.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /cotas/1
  # PUT /cotas/1.json
  def update
    @cota = Cota.find(params[:id])

    savePictures

    respond_to do |format|
      if @cota.update_attributes(params[:cota])
        format.html { redirect_to @cota, notice: 'Cota was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @cota.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cotas/1
  # DELETE /cotas/1.json
  def destroy
    @cota = Cota.find(params[:id])
    @cota.destroy

    respond_to do |format|
      format.html { redirect_to cotas_url }
      format.json { head :ok }
    end
  end

  def conect_to_s3
    AWS::S3::Base.establish_connection!( :access_key_id => 'AKIAJ7ZNS42OYFZPC3LA', :secret_access_key => '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')
  end

  def savePictures
    conect_to_s3
    pic = params[:cota][:imagem]
    if pic
      @cota.imagem = params[:cota][:nome].to_s.gsub(" ", "_") << ".jpg"
      params[:cota][:imagem] = @cota.imagem
      AWS::S3::S3Object.store(params[:cota][:nome].to_s.gsub(" ", "_") << ".jpg", open(pic.tempfile.path) , 'rails_s3', :access => :public_read)
    end
  end
end
