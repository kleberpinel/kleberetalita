class OiAutenticacaoController < ApplicationController
	
	before_filter :user_must_oi, :only => [:paginaRestrita, :logout]
	
	COOKIE_OI_INTERNET = 'ckOnline' 
	SERVIDOR_AUTENTICACAO = 'http://autenticacao.oidev.com.br/autenticacao/'
	
	def paginaRestrita
		#apenas um direcionamento para uma pagina qualquer restrita
	end

	def paginaAberta
		#apenas um direcionamento para uma pagina qualquer aberta
	end

	def logout
		siteOrigin = request.domain
		options = {}
		if request.cookies['ckOnline'] != nil
			options = { :headers => { 'cliente' => siteOrigin, 'Cookie' => COOKIE_OI_INTERNET + '=' + request.cookies['ckOnline'] } }
		end
		response = HTTParty.get(SERVIDOR_AUTENTICACAO + 'deslogar', options)
		data = JSON.parse(response.body)

		if data["autenticacao"]["status"] == 'nao_autenticado'
			redirect_to "/oiAutenticacao/paginaAberta"
		end
	end

	def callbackAuthentication
		cookies[:ckOnline] = params[:key]
		redirect_to params[:returnTo]
	end

	def user_must_oi
		siteOrigin = request.domain
		parans = "origin=" + siteOrigin
		
		options = {}
		if request.cookies['ckOnline'] != nil
			options = { :headers => { 'cliente' => siteOrigin, 'Cookie' => COOKIE_OI_INTERNET + '=' + request.cookies['ckOnline'] } }
		elsif params[:key] != nil
			options = { :headers => { 'cliente' => siteOrigin, 'Cookie' => COOKIE_OI_INTERNET + '=' + params[:key] } }
		else
			options = { :headers => { 'cliente' => siteOrigin } }
		end
		response = HTTParty.get(SERVIDOR_AUTENTICACAO , options)
		data = JSON.parse(response.body)
		
		identificador = data["autenticacao"]["identificador"].to_s
		if request.cookies['ckOnline'].to_s != identificador 
			cookies[:ckOnline] = {:value => identificador}
		end
		
		if data["autenticacao"]["status"] == 'nao_autenticado'
			parans << '&key=' + identificador 
			parans << '&returnTo=/oiAutenticacao/paginaRestrita' 
			redirect_to "http://hanoi-auth-dev.dev.infra/autenticacao/login?" + parans;
		end
	end
end