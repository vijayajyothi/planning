Opsgps::Application.routes.draw do
  resources :ovms


  resources :ovdcs


  resources :f5_devices


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
match 'mail_deleted_vms', to: 'vms#mail_deleted_vms', as: 'mail_deleted_vms'

get "home/index"
get "home/server_error"
get "/search_list" => "home#search_list", :as => :search_list

get "/vms" => "vms#index", :as => :vms
get "export", to: "vms#export", :as => :export
get "export_all", to: "vms#export_all", :as => :export_all
get "linux_vms", to: "vms#linux_vms", :as => :linux_vms
get "deleted_vms", to: "vms#deleted_vms", :as => :deleted_vms
get "windows_vms", to: "vms#windows_vms", :as => :windows_vms
get "/selected_vm/:id" => "vms#selected_vm", :as => :selected_vm
get "/edit_deleted_vm/:id" => "vms#edit_deleted_vm", :as => :edit_deleted_vm
get "/show_deleted_vm/:id" => "vms#show_deleted_vm", :as => :show_deleted_vm
get "select_type" =>"vms#select_type", :as => :select_type


get "/vcenters" => "vcenters#index", :as => :vcenters
get "/selected_vcenter/:id" => "vcenters#selected_vcenter", :as => :selected_vcenter
get "/remove/:id" => "vcenters#remove", :as => :remove


get "/vdcs" => "vdcs#index", :as => :vdcs
get "/selected_vdc/:id" => "vdcs#selected_vdc", :as => :selected_vdc

get "/clusters" => "clusters#index", :as => :clusters
get "/selected_cluster/:id" => "clusters#selected_cluster", :as => :selected_cluster

get "/vmhosts" => "vmhosts#index", :as => :vmhosts
get "/selected_vmhost/:id" => "vmhosts#selected_vmhost", :as => :selected_vmhost

# Error Logs
match '/404' =>'error#not_found'
match '/422' =>'error#server_error'
match '/500' =>'error#server_error'

# F5 Cluster
get "/f5s" => "f5_clusters#index", :as => :f5s
get "/selected_f5cluster/:id" => "f5_clusters#selected_f5cluster", :as => :selected_f5cluster

# F5 Cluster
get "/f5vips" => "f5_vips#index", :as => :f5vips
get "/selected_f5_vip/:id" => "f5_vips#selected_f5_vip", :as => :selected_f5_vip

# F5 Cluster
get "/f5devices" => "f5_devices#index", :as => :f5devices
get "/selected_f5_device/:id" => "f5_devices#selected_f5_device", :as => :selected_f5_device

get "/ovdcs" => "ovdcs#index", :as => :ovdcs
get "/selected_ovdc/:id" => "ovdcs#selected_ovdc", :as => :selected_ovdc

get "/ovms" => "ovms#index", :as => :ovms
get "/selected_ovm/:id" => "ovms#selected_ovm", :as => :selected_ovm
get "export_ovm", to: "ovms#export_ovm", :as => :export_ovm

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
  # root :to => 'home#server_error'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
