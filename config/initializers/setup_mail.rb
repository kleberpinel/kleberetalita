ActionMailer::Base.smtp_settings = {  
  :address              => "smtp.gmail.com",  
  :port                 => 589,  
  :domain               => "asciicasts.com",  
  :user_name            => "kleberetalita@gmail.com",
  :password             => "TalitaSack@#09@2",  
  :authentication       => "plain",  
  :enable_starttls_auto => true  
}  
  
ActionMailer::Base.default_url_options[:host] = "localhost:3000"  