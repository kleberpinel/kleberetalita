class CategoriaController < ApplicationController
  # GET /categoria
  # GET /categoria.json
  def index
    @categoria = Categorias.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @categoria }
    end
  end

  # GET /categoria/1
  # GET /categoria/1.json
  def show
    @categorias = Categorias.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @categorias }
    end
  end

  # GET /categoria/new
  # GET /categoria/new.json
  def new
    @categorias = Categorias.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @categorias }
    end
  end

  # GET /categoria/1/edit
  def edit
    @categorias = Categorias.find(params[:id])
  end

  # POST /categoria
  # POST /categoria.json
  def create
    @categorias = Categorias.new(params[:categorias])

    respond_to do |format|
      if @categorias.save
        format.html { redirect_to @categorias, notice: 'Categorias was successfully created.' }
        format.json { render json: @categorias, status: :created, location: @categorias }
      else
        format.html { render action: "new" }
        format.json { render json: @categorias.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /categoria/1
  # PUT /categoria/1.json
  def update
    @categorias = Categorias.find(params[:id])

    respond_to do |format|
      if @categorias.update_attributes(params[:categorias])
        format.html { redirect_to @categorias, notice: 'Categorias was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @categorias.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categoria/1
  # DELETE /categoria/1.json
  def destroy
    @categorias = Categorias.find(params[:id])
    @categorias.destroy

    respond_to do |format|
      format.html { redirect_to categoria_url }
      format.json { head :ok }
    end
  end
end
