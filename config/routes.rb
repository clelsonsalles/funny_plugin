# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html


Rails.application.routes.draw do
    resources :cliente, only: [:new, :create, :destroy, :edit, :update, :index]
    get 'clientes', :to => 'cliente#list'
    get 'aguarde', :to => 'cliente#aguarde'
    match 'cliente/register', :to => 'cliente#register', :via => [:get, :post], :as => 'registrar'
    get 'cliente/analista', :to => 'cliente#index_analista'
    get 'cliente/cliente_analista', :to => 'cliente#cliente_analista'
    
    resources :coleta_mensal, only: [:new, :create, :destroy, :edit, :update, :index]

    get 'coleta/mensal/criar', :to => 'coleta_mensal#criar'
    get 'coleta/mensal/fazer/scm', :to => 'coleta_mensal#fazer_scm'
    get 'coleta/mensal/fazer/seac', :to => 'coleta_mensal#fazer_seac'
    get 'coleta/mensal/fazer/stfc', :to => 'coleta_mensal#fazer_stfc'
    
    resources :coleta_semestral, only: [:new, :create, :destroy, :edit, :update, :index]
    get 'coleta/semestral/criar', :to => 'coleta_semestral#criar'
    get 'coleta/semestral/fazer', :to => 'coleta_semestral#fazer'
    
    resources :coleta_anual, only: [:new, :create, :destroy, :edit, :update, :index]
    get 'coleta/anual/criar', :to => 'coleta_anual#criar'
    get 'coleta/anual/fazer', :to => 'coleta_anual#fazer'


end
