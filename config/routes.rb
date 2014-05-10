Rails.application.routes.draw do
  root to: "home#index"

  get "/buy",   to: "memberships#new", as: :new_membership
  get "/about", to: "static_pages#about", as: :about
  resource :memberships,
    only: [:create]
end
