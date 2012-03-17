Kleberetalita::Application.routes.draw do
  
  resources :categoria

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :categorias
  resources :usuarios
  
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