class ConvidadosController < ApplicationController
  	def list
		@convidado = Convidado.new(params[:convidado])
		logger.debug @convidado.inspect

		t = Convidado.arel_table
		@convidados = Convidado.where(t[:nome].matches("%" << @convidado.nome.to_s << "%")).paginate(:page => params[:page], :per_page => 20)
 	end

  	def create
		@usuario = User.find(params[:user_id])
		@convidado = @usuario.convidados.create(params[:convidado])
		redirect_to usuario_path(@usuario)
	end

	def destroy
		@usuario = User.find(params[:user_id])
		@convidado = @usuario.convidados.find(params[:id])
		@convidado.destroy
		redirect_to usuario_path(@usuario)
	end

end
