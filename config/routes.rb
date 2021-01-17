Rails.application.routes.draw do
  post "/graphql", to: "graphql#execute"
  resources :tags
  resources :images
  mount_graphql_devise_for 'User', at: 'auth'

  mount_graphql_devise_for 'User', at: 'graphql_auth'
  as :user do
    # Define routes for User within this block.
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
