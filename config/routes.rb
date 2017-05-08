Rails.application.routes.draw do
  resources :ferramentas
  mount PdfjsViewer::Rails::Engine => "/pdfjs", as: 'pdfjs'
  resources :produtos
  resources :celulas
  resources :centros
  resources :paradas
  resources :rejeitos
  resources :turnos
  resources :pedidos do
    get :atualizar_status, on: :member
    get :detalhar_projeto, on: :member
  end
  resources :clientes
  resources :terminais
  resources :maquinas do
    get :finalizar, on: :member
  end
  resources :fornecedores
  resources :usuarios
  devise_for :usuarios, :path_prefix => 'auth'
  root to: 'pedidos#index'
  get 'welcome/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
