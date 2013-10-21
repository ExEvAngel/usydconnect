Usydconnect::Application.routes.draw do
  get "users/new"
  
  root "static_pages#home"

  match("/login", to: "static_pages#create", via: "post")
  match("/help", to: "static_pages#help", via: "get")
  match("/about", to: "static_pages#about", via: "get")
  match("/policy", to: "static_pages#policy", via: "get")
  match("/signout", to: "static_pages#destroy", via: "delete")
  match("/results", to: "static_pages#results", via: "get")
  match("/follow", to: "static_pages#follow", via: "get")
  
  match("/user/follow", to: "users#follow", via: "post")
  match("/user/unfollow", to: "users#unfollow", via: "post")
  match("/profile", to: "users#profile", via: "get")
  match("/new", to: "users#create", via: "post")
  match("/signup", to: "users#new", via: "get")
  
  match("/thread", to: "thread#thread", via: "get")
  match("/thread/new", to: "thread#new", via: "get")
  match("/thread/submit", to: "thread#create", via: "post")
  match("/thread/submitc", to: "thread#createcomments", via: "post")
  match("/thread/follow", to: "thread#follow", via: "post")
  match("/thread/unfollow", to: "thread#unfollow", via: "post")
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  # get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  # get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  # resources :products

  # Example resource route with options:
  # resources :products do
  # member do
  # get 'short'
  # post 'toggle'
  # end
  #
  # collection do
  # get 'sold'
  # end
  # end

  # Example resource route with sub-resources:
  # resources :products do
  # resources :comments, :sales
  # resource :seller
  # end

  # Example resource route with more complex sub-resources:
  # resources :products do
  # resources :comments
  # resources :sales do
  # get 'recent', on: :collection
  # end
  # end
  
  # Example resource route with concerns:
  # concern :toggleable do
  # post 'toggle'
  # end
  # resources :posts, concerns: :toggleable
  # resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  # namespace :admin do
  # # Directs /admin/products/* to Admin::ProductsController
  # # (app/controllers/admin/products_controller.rb)
  # resources :products
  # end
end