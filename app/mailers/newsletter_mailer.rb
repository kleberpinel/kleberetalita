class NewsletterMailer < ActionMailer::Base
  default from: "kleberetalita@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.newsletter_mailer.weekly.subject
  #
  def weekly(email, assunto)
    mail.attachments['Vestidos_-_Madrinhas_-_Cor.pdf'] = File.read('/Users/kbernardo/Documents/Casamento/Casamento/Documentos/Vestidos_-_Madrinhas_-_Cor.pdf')
    mail to: email, subject: assunto, :bcc => ["Kleber Pinel <kleberpinel@gmail.com>", "Talita Sack - LW <talita.sack@l-w.com>", "Talita Sack - Hotmail <talita_sack@hotmail.com>"]
  end

end