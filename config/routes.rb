Rails.application.routes.draw do
  mount PdfjsViewer::Rails::Engine => "/pdfjs", as: 'pdfjs'
  resources :produtos
  resources :celulas
  resources :centros
  resources :paradas
  resources :rejeitos
  resources :turnos
  resources :pedidos
  resources :clientes
  resources :terminais
  resources :maquinas do
    get :finalizar, on: :member
  end
  resources :fornecedores
  resources :usuarios
  devise_for :usuarios, :path_prefix => 'auth'
  root to: 'welcome#index'
  get 'welcome/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
