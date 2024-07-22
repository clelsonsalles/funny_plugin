# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html


RedmineApp::Application.routes.draw do
  root :to => 'account#login'
end


Rails.application.routes.draw do
    resources :cliente, only: [:new, :create, :destroy, :edit, :update, :index]
    get 'clientes', :to => 'cliente#list'
    get 'aguarde', :to => 'cliente#aguarde'
    match 'cliente/register', :to => 'cliente#register', :via => [:get, :post], :as => 'registrar'
    resources :coleta_mensal, only: [:new, :create, :destroy, :edit, :update, :index]
    get 'coleta', :to => 'coleta_mensal#index'
    resources :clientes, only: [:new, :create, :destroy, :edit, :update, :index]
    get 'coletas', :to => 'cliente#index_cliente'


    

end
