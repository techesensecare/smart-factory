Rails.application.routes.draw do
  get 'sub_produtos/index'

  get 'sub_produtos/new'

  get 'sub_produtos/create'

  get 'sub_produtos/show'

  get 'sub_produtos/delete'

  get 'relatorios/pedidos'
  get 'relatorios/maquinas'
  get 'relatorios/maquinas/futuro' => 'relatorios#maquinas_futuro'
  get 'relatorios/maquinas/paradas' => 'relatorios#maquinas_paradas'
  get 'relatorios/usuarios'
  get 'relatorios/usuarios/tempo_ocioso' => 'relatorios#usuarios_tempo_ocioso'
  get 'relatorios/usuarios/rejeitos' => 'relatorios#usuarios_rejeitos'
  get 'relatorios/producao'
  get 'relatorios/estoque'
  get 'relatorios/centro_de_trabalho'
  get 'relatorios/uso_de_pecas'

  get 'ordem_producao', to: 'ordem_producao#index', as: :ordem_producao

  #get 'auth/usuarios/sign_out', to: 'usuario#index', as: :destroy_usuario_session

  resources :contatos
  mount PdfjsViewer::Rails::Engine => "/pdfjs", as: 'pdfjs'

  resources :ferramentas
  resources :produtos do
    resources :movimentos
  end
  resources :celulas
  resources :centros
  resources :paradas
  resources :rejeitos
  resources :turnos

  get 'iniciar_operacao/:pedido_operacao_id', to: 'pedido_operacoes#iniciar_operacao', as: :iniciar_operacao
  post 'iniciar_operacao/:pedido_operacao_id', to: 'pedido_operacoes#iniciar_operacao_create', as: :iniciar_operacao_create
  get 'operacao_finalizada/:pedido_operacao_id', to: 'pedido_operacoes#operacao_finalizada', as: :operacao_finalizada 
  get 'operacoes/apagar_operacoes', to: 'pedido_operacoes#apagar_operacoes', as: :apagar_operacoes

  get 'travar_operacao/', to: 'pedido_operacoes#travar_operacao', as: :travar_operacao

  # get 'embalagens', to: 'embalagens#index', as: :embalagens
  
  resources :embalagens

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
  resources :materias_primas, only: [:show, :index, :new, :create]
  resources :componentes 
  devise_for :usuarios, :path_prefix => 'auth'
  root to: 'welcome#index'
  get 'welcome/index'
  get 'welcome/painel'
  get 'welcome/painel_fabrica'
  get '/operacoes/sem_maquina/', to: 'pedido_operacoes#sem_maquina' , as: :operacoes_sem_maquina
  get '/operacoes/:maquina_id/', to: 'pedido_operacoes#index' , as: :operacoes_maquina

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
