Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  

  get "/avianorders/new", to: "avian_orders#new"
  post "/avianorders/new", to: "avian_orders#create"
  get "/avianorders", to: "avian_orders#index"

  get "/avianorders/:avian_order_id/birds", to: "avian_orders_birds#index"
  get "/avianorders/:avian_order_id/birds/new", to: "avian_orders_birds#new"
  post "/avianorders/:avian_order_id/birds/new", to: "avian_orders_birds#create"

  get "/birds", to: "birds#index"
  get "/birds/:id", to: "birds#show"
  get "/birds/:id/edit", to: "birds#edit"
  patch "/birds/:id/edit", to: "birds#update"

  get "/avianorders/:id", to: "avian_orders#show"
  get "/avianorders/:id/edit", to: "avian_orders#edit"
  patch "/avianorders/:id/edit", to: "avian_orders#update"
  get "/avianorders/:id/delete", to: "avian_orders#destroy"
  
end
