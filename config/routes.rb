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

    match 'coleta/anual/fazeruf', :to => 'coletaanual#fazeruf', via: [:get, :post]
    match 'coleta/anual/fazercidadesuf', :to => 'coletaanual#fazercidadesuf', via: [:get, :post, :patch]
    match 'coleta/anual/fazer', :to => 'coletaanual#fazer', via: [:get, :post, :patch]
    match 'coleta/anual/atualizar', :to => 'coletaanual#atualizar', via: [:get, :post, :patch]
    post 'coleta/anual/ver', :to => 'coletaanual#ver'

    match 'coleta/semestral/fazer', :to => 'coletasemestral#fazer', via: [:get, :post]
    match 'coleta/semestral/atualizar', :to => 'coletasemestral#atualizar', via: [:get, :post, :patch]
    post 'coleta/semestral/ver', :to => 'coletasemestral#ver'

    match 'coleta/mensal/fazeruf', :to => 'coletamensal#fazeruf', via: [:get, :post]
    match 'coleta/mensal/fazercidadesuf', :to => 'coletamensal#fazercidadesuf', via: [:get, :post, :patch]
    match 'coleta/mensal/fazer', :to => 'coletamensal#fazer', via: [:get, :post, :patch]
    match 'coleta/mensal/atualizar', :to => 'coletamensal#atualizar', via: [:get, :post, :patch]
    post 'coleta/mensal/ver', :to => 'coletamensal#ver'

end
