Rails.application.routes.draw do
  get 'palindrome/input'
  get 'palindrome/view'

  get 'session/new'
  post 'session/create'

  resources :users

  get '/signin', to: "session#new"
  delete '/signout', to: "session#destroy"

  get '/signup', to: "users#new"

  root 'palindrome#input'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
