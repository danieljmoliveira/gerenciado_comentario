Rails.application.routes.draw do
  resources :temas


  get 'banco_ideia/escolher_cidade' => 'banco_ideia#escolher_cidade'
  get 'banco_ideia/exibir_ideias_tema' => 'banco_ideia#exibir_ideias_tema'
  get 'banco_ideia/exibir_ideia_completa' => 'banco_ideia#exibir_ideia_completa'
  get 'banco_ideia/classificar_ideia' => 'banco_ideia#classificar_ideia'

  get 'banco_ideia/new'

  #root 'banco_ideia#new'

  resources :banco_ideia


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  #


  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  get 'banco_ideia/salvar_dados_pessoa' => 'banco_ideia#salvar_dados_pessoa'


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
