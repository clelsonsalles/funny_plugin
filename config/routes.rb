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
    
    resources :coleta, only: [:new, :create, :destroy, :edit, :index]

    get 'coleta/visualizar', :to => 'coleta#visualizar'
    get 'coleta/gerarcsv', :to => 'coleta#gerarcsv'

    get 'coleta/mensalcriar', :to => 'coleta#mensalcriar'
    post 'coleta/mensalinserir', :to => 'coleta#mensalinserir'
    get 'coleta/mensalfazer', :to => 'coleta#mensalfazer'
    patch 'coleta/mensalcidadesuf', :to => 'coleta#mensalcidadesuf'
    patch 'coleta/mensalinformar', :to => 'coleta#mensalinformar'
    patch 'coleta/mensalatualizar', :to => 'coleta#mensalatualizar'
    get 'coleta/mensalvisualizar', :to => 'coleta#mensalvisualizar'
        
    get 'coleta/semestralcriar', :to => 'coleta#semestralcriar'
    post 'coleta/semestralinserir', :to => 'coleta#semestralinserir'
    get 'coleta/semestralfazer', :to => 'coleta#semestralfazer'
    patch 'coleta/semestralatualizar', :to => 'coleta#semestralatualizar'
    get 'coleta/semestralvisualizar', :to => 'coleta#semestralvisualizar'
    
     
    get 'coleta/anual/criar', :to => 'coleta_anual#criar'
    get 'coleta/anual/fazer', :to => 'coleta_anual#fazer'


end
