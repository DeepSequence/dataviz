Rails.application.routes.draw do
  resources :filtered_graphs

   get '/auth/:provider/callback', to: 'sessions#create'

  resources :dataset_types

  resources :graphs

  resources :datasets

  resources :graph_types

  get 'main/index'
  get 'main/admin'
  get 'about' => 'main#about'
  get 'about/:layout'=> 'main#about'
  get 'datasets_browse' => 'datasets#browse'

  get 'sign_in' =>'sessions#new'
  delete 'sign_out' => 'sessions#destroy'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'main#index'


 get 'graph_list' => 'graphs#graph_list'
 get 'graph_list/:type' => 'graphs#graph_list'
 get 'show_simple/:id' => 'graphs#show_simple'



 
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
