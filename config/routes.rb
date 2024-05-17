# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html

Rails.application.routes.draw do
    resources :cliente, only: [:new, :create, :destroy, :edit, :update, :index, :aguarde]
    get 'clientes', :to => 'cliente#list'
    get 'create_cliente', :to => 'cliente#create'

end
