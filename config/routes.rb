Opsgps::Application.routes.draw do
  resources :vcenters


  resources :storage_groups


  resources :vswitches


  resources :vnics


  resources :vmvips


  resources :new_vms


  resources :vmhosts


  resources :vim_events


  resources :vdisks


  resources :vdcs


  resources :tiers


  resources :storage_processors


  resources :storage_luns


  resources :storage_group_luns


  resources :storage_daes


  resources :storage_arrays


  resources :search_types


  resources :services


  resources :san_switches


  resources :san_ports


  resources :portgroups


  resources :pnics


  resources :physical_disks


  resources :network_switches


  resources :network_ports


  resources :lun_disks


  resources :instances


  resources :hw_devices


  resources :host_luns


  resources :hhbas


  resources :folders


  resources :field_labels


  resources :fibre_commections


  resources :f5_vips


  resources :f5_pools


  resources :f5_nodes


  resources :f5_clusters


  resources :dns_records


  resources :datastores


  resources :clusters


  resources :appresources


  resources :applications


  resources :vms
  
  resources :vms do 
    collection {
      post :import
      
     # post :details
   }
   member do 
  end
end

resources :password_resets

resources :sessions

resources :users

match 'reports', to: 'vms#reports', as: 'reports'
match 'logout', to: 'sessions#destroy', as: 'logout'

match 'login', to: 'sessions#new', as: 'login'

match 'signup', to: 'users#new', as: 'signup'

get "home/index"
get "/search_list" => "home#search_list", :as => :search_list

get "/vms" => "vms#index", :as => :vms
get "/selected_vm/:id" => "vms#selected_vm", :as => :selected_vm

get "/vcenters" => "vcenters#index", :as => :vcenters
get "/selected_vcenter/:id" => "vcenters#selected_vcenter", :as => :selected_vcenter


get "/vdcs" => "vdcs#index", :as => :vdcs
get "/selected_vdc/:id" => "vdcs#selected_vdc", :as => :selected_vdc

get "/clusters" => "clusters#index", :as => :clusters
get "/selected_cluster/:id" => "clusters#selected_cluster", :as => :selected_cluster

get "/vmhosts" => "vmhosts#index", :as => :vmhosts
get "/selected_vmhost/:id" => "vmhosts#selected_vmhost", :as => :selected_vmhost
#signup_path
#login_path
#logout_path
#password_reset_path
resources :users 
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
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
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
  #       get 'recent', :on => :collection
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
  root :to => 'home#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
