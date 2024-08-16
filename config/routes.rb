# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html


Rails.application.routes.draw do
    resources :cliente, only: [:new, :create, :destroy, :edit, :update, :index]
    get 'clientes', :to => 'cliente#list'
    get 'aguarde', :to => 'cliente#aguarde'
    match 'cliente/register', :to => 'cliente#register', :via => [:get, :post], :as => 'registrar'

    resources :analista, only: [:new, :create, :destroy, :edit, :update, :index]
    get 'analista/clientes', :to => 'analista#index_analista'
    get 'analista/cliente_analista', :to => 'analista#cliente_analista'
    
    resources :coleta_mensal, only: [:new, :create, :destroy, :edit, :update, :index]

    get 'coleta/mensal/criar', :to => 'coleta_mensal#criar'
    post 'coleta/mensal/inserir', :to => 'coleta_mensal#inserir'
    get 'coleta/mensal/fazer/scm', :to => 'coleta_mensal#fazer_scm'
    get 'coleta/mensal/fazer/seac', :to => 'coleta_mensal#fazer_seac'
    get 'coleta/mensal/fazer/stfc', :to => 'coleta_mensal#fazer_stfc'
    
    resources :coleta_semestral, only: [:new, :create, :destroy, :edit, :update, :index]
    get 'coleta/semestral/criar', :to => 'coleta_semestral#criar'
    post 'coleta/semestral/inserir', :to => 'coleta_semestral#inserir'
    get 'coleta/semestral/fazer/scm', :to => 'coleta_semestral#fazer_scm'
    get 'coleta/semestral/fazer/seac', :to => 'coleta_semestral#fazer_seac'
    get 'coleta/semestral/fazer/smp', :to => 'coleta_semestral#fazer_smp'
    
    resources :coleta_anual, only: [:new, :create, :destroy, :edit, :update, :index]
    get 'coleta/anual/criar', :to => 'coleta_anual#criar'
    get 'coleta/anual/fazer', :to => 'coleta_anual#fazer'


end
