Rails.application.routes.draw do
  root to: "home#index"

  get "/buy", to: "memberships#new", as: :new_membership
  resource :memberships,
    only: [:create]
end
