Rails.application.routes.draw do
  resources :ferramentas
  mount PdfjsViewer::Rails::Engine => "/pdfjs", as: 'pdfjs'
  resources :produtos
  resources :celulas
  resources :centros
  resources :paradas
  resources :rejeitos
  resources :turnos
  resources :pedido_operacoes do
    get :update_status, on: :member
  end
  resources :pedidos do
    get :atualizar_status, on: :member
    get :detalhar_projeto, on: :member
  end
  resources :clientes
  resources :terminais
  resources :maquinas do
    get :finalizar, on: :member
    get :finalizar_setup, on: :member
    get :iniciar_setup,   on: :member
  end
  resources :fornecedores
  resources :usuarios
  devise_for :usuarios, :path_prefix => 'auth'
  root to: 'welcome#index'
  get 'welcome/index'
  get '/operacoes/:maquina_id/', to: 'pedido_operacoes#index' , as: :operacoes_maquina

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
