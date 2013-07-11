Kleberetalita::Application.routes.draw do
  
  get "contato/form"

  post "contato/enviar"

  get "convidados/list"

  post "confirmacao_presenca/step1"
  put "confirmacao_presenca/step2"
  put "confirmacao_presenca/sucesso"

  get "importer/importar"
  get "importer/remover"
  get "importer/editar" 

  resources :cotas

  resources :categoria_cotas

  resources :albums #do
  #  resources :fotos
  #end

  resources :fotos

  # match "/fotos",             :to => "fotos#index",     :as => "fotos",     :via => :get
  # match "/foto/new",             :to => "fotos#new",     :as => "new_foto",     :via => :get
  # match "/fotos",             :to => "fotos#create",     :as => "fotos",     :via => :post
  
  resources :autors

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :users do
    resources :convidados
  end


  resources :categorias
  
  resources :usuarios
  
  resources :posts do
    resources :comments
  end

  match "/blog/:id/view",             :to => "blog#view",     :as => "view_blog",     :via => :get
  match "/blog/:id_autor/list",       :to => "blog#list",     :as => "list_blog",     :via => :get
  match "/blog/:id/list/category",    :to => "blog#category", :as => "category_blog", :via => :get
  
  match "/autors/:id/view",           :to => "autors#view",   :as => "view_autors",   :via => :get
  match "/usuarios/:id",           :to => "usuarios#update",   :as => "user",   :via => :put

  match "/foto/select/",           :to => "fotos#select",   :as => "select_foto",   :via => :get
  match "/foto/select/one/:tipo_foto",           :to => "fotos#selectOne",   :as => "select_one_foto",   :via => :get

  get "events/list"
  get "events/dates"
  get "events/gift"

  match "/presentes",  :to => "events#gift"

  get "index/historia"
  get "index/home"
  root :to => 'index#home' 

  get "oiAutenticacao/paginaAberta"
  get "oiAutenticacao/paginaRestrita"
  get "oiAutenticacao/verificarLogado"
  get "oiAutenticacao/logout"
  get "oiAutenticacao/callbackAuthentication"

end