Bbv4::Application.routes.draw do
  match '/calendar(/:year(/:month))' => 'calendar#index', :as => :calendar, :constraints => {:year => /\d{4}/, :month => /\d{1,2}/}

  resources :pnotes
resources :events
resources :pnotes

resources :predictions
resources :preports do
    resources :pnotes
end

  get "flashboard/index"

  resources :calls

  resources :attachments

  resources :announcements

    resources :import_tables
    post 'import_tables/:id' => 'import_tables#merge'

    get "csv/import"
    post "csv/import" => 'csv#upload'

    

    
    resources :sales do
      get :autocomplete_customer_name, :on => :collection
      
    end

    resources :assignments

    resources :roles

    resources :customers do
      resources :attachments
      resources :calls
      get :delete_bad, :on=> :collection
    end
    


    resources :ratgrades do
      resources :sales do
        get :autocomplete_customer_name, :on => :collection
      end
    end


    resources :warehouses

    resources :boards do
      get :rat_sales, :on => :member
      get :print_sales, :on => :member
      get :print_unprinted_sales, :on => :member
      get :print_user_sales, :on => :member
      
      get :print_csv, :on => :member
      resources :preports do
        resources :predictions
      end
    end

    resources :reports do
      get :distribute, :on=>:member
    end
    
    
    resources :users
    resources :user_sessions
    match "login" => "user_sessions#new", :as => "login" 
    match "register" => "users#new", :as => "register" 
    match "logout" => "user_sessions#destroy", :as => "logout"  
    match "dashboard" => "dashboard#index", :as => "dashboard"   
    match "flashboard" => "flashboard#index", :as => "flashboard"   
    match '/calendar(/:year(/:month))' => 'calendar#index', :as => :calendar, :constraints => {:year => /\d{4}/, :month => /\d{1,2}/}
    
    root :to => "dashboard#index"

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get :short
  #       post :toggle
  #     end
  #
  #     collection do
  #       get :sold
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get :recent, :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
