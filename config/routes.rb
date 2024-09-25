# Plugin's routes
# See: http://guides.rubyonrails.org/routing.htmlEstação


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
    post 'coleta/mensalfazer', :to => 'coleta#mensalfazer'
    post 'coleta/mensalcidadesuf', :to => 'coleta#mensalcidadesuf'
    post 'coleta/mensalinformar', :to => 'coleta#mensalinformar'
    post 'coleta/mensalatualizar', :to => 'coleta#mensalatualizar'
    get 'coleta/mensalvisualizar', :to => 'coleta#mensalvisualizar'
        
    get 'coleta/semestralcriar', :to => 'coleta#semestralcriar'
    post 'coleta/semestralinserir', :to => 'coleta#semestralinserir'
    post 'coleta/semestralfazer', :to => 'coleta#semestralfazer'
    post 'coleta/semestralatualizar', :to => 'coleta#semestralatualizar'
    get 'coleta/semestralvisualizar', :to => 'coleta#semestralvisualizar'
    
     
    get 'coleta/anualcriar', :to => 'coleta#anualcriar'
    post 'coleta/anualinserir', :to => 'coleta#anualinserir'
    match 'coleta/anualfazer', :to => 'coleta#anualfazer', via: [:get, :post]
    post 'coleta/anualcidadesuf', :to => 'coleta#anualcidadesuf'
    post 'coleta/anualinformar', :to => 'coleta#anualinformar'
    post 'coleta/anualatualizar', :to => 'coleta#anualatualizar'
    get 'coleta/anualvisualizar', :to => 'coleta#anualvisualizar'


    match 'coleta/anual/fazer', :to => 'coletaanual#fazer', via: [:get, :post]
    post 'coleta/anual/atualizar', :to => 'coletaanual#atualizar'


end
