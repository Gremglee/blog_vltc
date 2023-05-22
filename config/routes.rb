Rails.application.routes.draw do
  root "posts#index"

  resources :posts
  resources :comments, only: [:create]

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  post "/graphql", to: "graphql#execute"

  mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"

  namespace :admin do
    root to: "users#index"

    resources :users
  end
end
