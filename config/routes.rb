Kleberetalita::Application.routes.draw do
  #match '/auth/:provider/callback' => 'authentications#create'
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  #devise_for :users, :controllers => {:registrations => 'registrations'}

  #resources :authentications
  
  resources :posts do
    resources :comments
  end
  match "/blog/:id/view", :to => "blog#view", :as => "view_blog", :via => :get
  get "blog/list"
  get "events/list"
  get "index/historia"
  get "index/home"
  root :to => 'index#home'

end
