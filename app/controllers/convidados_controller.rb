class ConvidadosController < ApplicationController
  def list
  	@convidado = Convidado.new(params[:convidado])
  	logger.debug @convidado.inspect
  	
  	t = Convidado.arel_table
  	@convidados = Convidado.where(t[:nome].matches("%" << @convidado.nome.to_s << "%")).paginate(:page => params[:page], :per_page => 20)
  end

end
