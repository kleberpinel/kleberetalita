Kleberetalita::Application.routes.draw do
  
  resources :autors

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :categorias
  
  resources :usuarios
  
  resources :posts do
    resources :comments
  end
  
  match "/blog/:id/view",             :to => "blog#view",     :as => "view_blog",     :via => :get
  match "/blog/:id_autor/list",       :to => "blog#list",     :as => "list_blog",     :via => :get
  match "/blog/:id/list/category",    :to => "blog#category", :as => "category_blog", :via => :get
  
  match "/autors/:id/view",           :to => "autors#view",   :as => "view_autors",   :via => :get

  get "events/list"
  get "events/dates"
  get "index/historia"
  get "index/home"
  root :to => 'index#home' 

end