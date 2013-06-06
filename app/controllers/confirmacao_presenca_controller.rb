class ConfirmacaoPresencaController < ApplicationController
	def step1
		if params[:nome_convite] == ""
			self.redirect_home "Favor digitar o nome descrito na TAG do convite"
			return
		end

		@usuario = User.find(:first, :conditions => [ "nome_convite = :u", { :u => params[:nome_convite].strip }])

		if @usuario == nil
			self.redirect_home "Nao existe nenhuma TAG com esse texto escrito"
			return
		end

		respond_to do |format|
	      format.html # step1.html.erb
	      format.json { render :json => @usuario }
	    end
	end

	def redirect_home(msg_erro)
		redirect_to :controller => "index", :action => "home", :error_msg => msg_erro
	end

	def step2
		@usuario = User.find(params[:user][:id])
		params[:user][:convidados_attributes].each do |attr_name, attr_value|
			@convidado = Convidado.find(attr_value[:id])
			@convidado.update_attributes(attr_value)
		end
	end

	def sucesso
	    @usuario = User.find(params[:user][:id])    
	    @usuario.update_attributes(params[:user])

	    @existe_confirmados = false

	    @usuario.convidados.each do |convidado|
	    	if convidado.confimacao_presenca_cerimonia || convidado.confimacao_presenca_festa
	    		@existe_confirmados = true
	    	end
	    end
	end

end
