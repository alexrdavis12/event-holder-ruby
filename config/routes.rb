Rails.application.routes.draw do
  resources :users
  get '/' => 'sessions#login'
  get 'answer.csv' => 'answers#index', :as => :answers
  get 'login'  => 'sessions#login'
  get 'home'=>'sessions#home'
  get 'login_attempt'=>'sessions#login_attempt'
  post 'login_attempt'=>'sessions#login_attempt'
  get 'logout' => 'sessions#logout'
  get 'profile' => 'sessions#profile'
  get 'setting' => 'sessions#setting'
  post 'setting' => 'sessions#setting'
  get 'create' => 'sessions#create'
  post 'create' => 'sessions#create'
  post 'QuestionCreate' => 'questions#create'
  post 'EventCreate' => 'events#create'
  get 'QuestionCreate' => 'questions#create'
  get 'EventCreate' => 'events#create'
  root 'welcome#index'
  get 'questionshow' => 'questions#show'
  get 'eventshow' => 'events#show'
  get 'eventsurvey' => 'answers#showquestion'
  post 'eventsurvey' => 'answers#create'
  get 'allevent' => 'events#allevent'
  # post 'allevent' => 'events#allevent'
  get 'answershow' =>'answers#show'
  get 'admin'=>'admin#index'
  get 'datashow'=>'admin#show'
  get 'graphshow'=>'admin#graphshow'
  get 'eventdelete'=>'admin#delete'
  # post 'answershow' =>'answers#show'
  # get 'create' => 'answers#create'
  # post 'create' => 'answers#create'
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
