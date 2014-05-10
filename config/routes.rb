Rails.application.routes.draw do
  root to: "home#index"

  get "/buy",   to: "memberships#new", as: :new_membership
  post "/memberships", to: "memberships#create", as: :create_membership
  get "/plans", to: "memberships#index", as: :memberships

  get "/login", to: "authentication#login",    as: :login
  post "/authenticate", to: "authentication#create", as: :authenticate

  get "/forgot_password", to: "authentication#forgot_password", as: :forgot_password

  get "/about", to: "static_pages#about", as: :about
  get "/contact", to: "static_pages#contact", as: :contact
  get "/terms", to: "static_pages#terms_and_conditions", as: :terms_and_conditions
  get "/privacy", to: "static_pages#privacy", as: :privacy

  resource :memberships,
    only: [:create]

  resources :offers,
    only: [:index, :show]

end
