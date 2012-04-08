class ApplicationController < ActionController::Base
	protect_from_forgery

	def after_sign_in_path_for(resource)
		return request.env['omniauth.origin'] || stored_location_for(resource) || root_path
	end

	def user_must_be
	    if user_signed_in?
	      if current_user.email != "kleberpinel@gmail.com" && current_user.email != "talita_sack@hotmail.com"
	        flash[:error] = "Seu usuario nao tem premissao para acessar esta area do site!"
	        redirect_to index_home_url # halts request cycle
	      end 
	    end
	  end

	def historia
	end

end
