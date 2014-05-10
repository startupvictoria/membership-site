Rails.application.routes.draw do
  root to: "home#index"

  get "/buy",   to: "memberships#new", as: :new_membership
  get "/plans", to: "memberships#index", as: :memberships

  get "/login", to: "authentication#login", as: :login

  get "/about", to: "static_pages#about", as: :about
  get "/contact", to: "static_pages#contact", as: :contact
  resource :memberships,
    only: [:create]
end
