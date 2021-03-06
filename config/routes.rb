Rails.application.routes.draw do

  #get 'welcome/index'

  get  'place/index'
  get  'place/edit'
  get  'place/create'
  post 'place/new'
  post 'place/update'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)

  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase
resources :users
resources :place

root  to: 'welcome#index'

match '/about',   to: 'welcome#about',    via:    'get'
match '/contact', to: 'welcome#contact',  via:    'get'
match '/price',   to: 'welcome#price',    via:    'get'
match '/planner', to: 'welcome#planner',  via:    'get'
match '/signup',  to: 'users#new',        via:    'get'
match '/signin',  to: 'sessions#new',     via:    'get'
match '/signin',  to: 'sessions#create',  via:    'post'
match '/signout', to: 'sessions#destroy', via:    'delete'
match '/place',   to: 'place#index',      via:    'get'


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
