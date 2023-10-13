Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "/avianorders", to: "avian_orders#index"
  get "/avianorders/:id", to: "avian_orders#show"
  get "/birds", to: "birds#index"
end
