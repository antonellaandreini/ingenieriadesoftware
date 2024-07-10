Rails.application.routes.draw do

  get 'password_resets/new'

  devise_for :users
  resources :logros
  resources :postulacions

  resources :gauchadas
  resources :preguntums
  resources :preguntas
  get '/misgauchadas', to: 'gauchadas#misgauchadas'

  resources :gauchadas do
    post "calificar", on: :member
    get "misgauchadas", on: :collection
  end
  get '/mispostulaciones', to: 'gauchadas#mispostulaciones'
  get '/gauchadascumplidas', to: 'gauchadas#cumplidas'

  get '/realizar', to: 'gauchadas#marcar'
  root 'gauchadas#index'
  get '/comprar_puntos/edit', to: 'comprar_puntos#edit'
  get '/comprar_puntos/actualizar', to: 'comprar_puntos#actualizar'
  get '/buscar', to: 'gauchadas#buscar'
  get '/postulacion/aceptar', to: 'postulacions#aceptar'
  get '/postulacion/rechazar', to: 'postulacions#rechazar'
  get '/reporteusuario', to: 'comprar_puntos#reporteusuario'
  get '/reporteganancia', to: 'comprar_puntos#reporteganancia'
  get '/buscarpagos', to: 'comprar_puntos#buscarpagos'
  post '/comentario', to: 'pregunta#create'
  post '/respuesta', to: 'pregunta#responder'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
