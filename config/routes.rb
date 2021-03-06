Rails.application.routes.draw do
  post "/graphql", to: "graphql#execute"
  mount_graphql_devise_for 'User', at: 'auth'

  mount_graphql_devise_for 'User', at: 'graphql_auth'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
