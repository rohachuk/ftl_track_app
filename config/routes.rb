Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "spends#index"
  resources :spends
  get "share", params: :token, controller: "spends", action: "share_show"
  post "generate_link", to: "user#generate_link", xhr: true
end
