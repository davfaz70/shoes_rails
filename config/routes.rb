Rails.application.routes.draw do
  resources :sizes
  resources :shoes_colors_sizes
  resources :shoes_categories
  resources :shoes
  resources :colors
  resources :categories
  post "/graphql", to: "graphql#execute"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
