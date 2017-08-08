Rails.application.routes.draw do
  resources :contatos
  # mount PdfjsViewer::Rails::Engine => "/pdfjs", as: 'pdfjs'

  resources :ferramentas
  resources :produtos do
    resources :movimentos
  end
  resources :celulas
  resources :centros
  resources :paradas
  resources :rejeitos
  resources :turnos
  resources :pedido_operacoes do
    get :update_status, on: :member
    get :update_prioridade, on: :member
    get :desmembrar, on: :member
    patch :confirmar_desmembramento, on: :member
    get :finalizar, on: :member
    patch :confirmar_finalizacao, on: :member
    get :sem_maquina, on: :collection
    get :definir_maquina, on: :member
    patch :confirmar_maquina, on: :member
  end
  resources :cronometros
  resources :pedidos do
    get :atualizar_status, on: :member
    get :detalhar_projeto, on: :member
    patch :confirmar_detalhes, on: :member
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
  get 'welcome/painel'
  get '/operacoes/sem_maquina/', to: 'pedido_operacoes#sem_maquina' , as: :operacoes_sem_maquina
  get '/operacoes/:maquina_id/', to: 'pedido_operacoes#index' , as: :operacoes_maquina

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
