Rails.application.routes.draw do
  devise_for :admins
   root 'dashboards#home'

  get 'physicians/new' => 'physicians/new',as: :new_physician
  post 'physicians/create' => 'physicians/create',as: :create_physician

  get 'patients/new' => 'patients/new',as: :new_patient
  post 'patients/create' => 'patients/create',as: :create_patient

  get 'appointments/new' => 'appointments/new',as: :new_appointment
  post 'appointments/create' => 'appointments/create',as: :create_appointment
  get '/appointments' => 'appointments#index',as: :appointments
  get '/appointments/:id/edit' => 'appointments#edit',as: :edit_appointment
  get 'appointments/today' => 'appointments#show',as: :show_appointments
  patch 'appointments/:id' => 'appointments#update',as: :update_appointment
  get 'patient/appointments' => 'appointments#patient',as: :patient_appointments
  get 'physician/appointments' => 'appointments#physician',as: :physician_appointments
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
