class OiAutenticacaoController < ApplicationController
	def verificarAutenticado
		response = HTTParty.get('http://dev-servicos.dev.infra/autenticacao')
		puts response.body, response.code, response.message, response.headers.inspect
	end
end
