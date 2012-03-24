class AutorsController < ApplicationController
  # GET /autors
  # GET /autors.json
  def index
    @autors = Autor.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @autors }
    end
  end

  # GET /autors/1
  # GET /autors/1.json
  def show
    @autor = Autor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @autor }
    end
  end

  # GET /autors/new
  # GET /autors/new.json
  def new
    @autor = Autor.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @autor }
    end
  end

  # GET /autors/1/edit
  def edit
    @autor = Autor.find(params[:id])
  end

  # POST /autors
  # POST /autors.json
  def create
    @autor = Autor.new(params[:autor])

    respond_to do |format|
      if @autor.save
        format.html { redirect_to @autor, notice: 'Autor was successfully created.' }
        format.json { render json: @autor, status: :created, location: @autor }
      else
        format.html { render action: "new" }
        format.json { render json: @autor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /autors/1
  # PUT /autors/1.json
  def update
    @autor = Autor.find(params[:id])

    respond_to do |format|
      if @autor.update_attributes(params[:autor])
        format.html { redirect_to @autor, notice: 'Autor was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @autor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /autors/1
  # DELETE /autors/1.json
  def destroy
    @autor = Autor.find(params[:id])
    @autor.destroy

    respond_to do |format|
      format.html { redirect_to autors_url }
      format.json { head :ok }
    end
  end
end
