class ContatoController < ApplicationController
  def form
  	@last_coments = Comment.limit(3).order("created_at DESC")
    @posts = Post.find(:all)
  end

  def enviar
  	NewsletterMailer.contato(params[:email], params[:assunto], params[:body]).deliver
  end

end
