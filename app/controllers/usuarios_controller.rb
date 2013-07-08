class UsuariosController < ApplicationController

  before_filter :authenticate_user!
  before_filter :user_must_be
  
  # GET /users
  # GET /users.json
  def index
    logger.debug "index"
    @users = User.find(:all, :order => "nome ASC")
    @user = User.new(params[:user])

    if @user.disponivel_festa
      @users = User.where("disponivel_cerimonia = ? OR disponivel_festa = ? ", true, true).order("disponivel_festa DESC").order("nome ASC")
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @users }
    end
  end
  
  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @usuario = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @usuario }
    end
  end

  # GET /users/1/edit
  def edit
    @usuario = User.find(params[:id])
    logger.info @usuario.inspect
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, :notice => 'User was successfully created.' }
        format.json { render :json => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.json { render :json => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])

        if params[:user][:convidados_attributes] != nil
          params[:user][:convidados_attributes].each do |attr_name, attr_value|
            @convidado = Convidado.find(attr_value[:id])
            @convidado.update_attributes(attr_value)
          end
        end 
        format.html { redirect_to @user, :notice => 'User was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :ok }
    end
  end

end