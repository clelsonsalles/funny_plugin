# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html


Rails.application.routes.draw do
    resources :cliente, only: [:new, :create, :destroy, :edit, :update, :index]
    get 'clientes', :to => 'cliente#list'
    get 'cliente/cliente', :to => 'cliente#index_cliente'
    get 'aguarde', :to => 'cliente#aguarde'
    match 'cliente/register', :to => 'cliente#register', :via => [:get, :post], :as => 'registrar'

    resources :analista, only: [:new, :create, :destroy, :edit, :update, :index]
    get 'analista/clientes', :to => 'analista#index_analista'
    get 'analista/cliente_analista', :to => 'analista#cliente_analista'
    
    resources :coleta_mensal, only: [:new, :create, :destroy, :edit, :update, :index]

    get 'coleta/mensal/criar', :to => 'coleta_mensal#criar'
    post 'coleta/mensal/inserir', :to => 'coleta_mensal#inserir'
    get 'coleta/mensal/fazer', :to => 'coleta_mensal#fazer'
    post 'coleta/mensal/atualizar', :to => 'coleta_mensal#atualizar'
        
    resources :coleta_semestral, only: [:new, :create, :destroy, :edit, :update, :index]
    get 'coleta/semestral/criar', :to => 'coleta_semestral#criar'
    get 'coleta/semestral/fazer', :to => 'coleta_semestral#fazer'
    post 'coleta/semestral/atualizar', :to => 'coleta_semestral#atualizar'
    
     
    resources :coleta_anual, only: [:new, :create, :destroy, :edit, :update, :index]
    get 'coleta/anual/criar', :to => 'coleta_anual#criar'
    get 'coleta/anual/fazer', :to => 'coleta_anual#fazer'


end
