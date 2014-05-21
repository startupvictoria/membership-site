Rails.application.routes.draw do
  constraints subdomain: 'www' do
    get ':any', to: redirect(subdomain: nil, path: '/%{any}'), any: /.*/
  end

  ActiveAdmin.routes(self)

  root to: "home#index"

  get "/buy",   to: "memberships#new", as: :new_membership
  post "/memberships", to: "memberships#create", as: :create_membership
  get "/plans", to: "memberships#index", as: :memberships

  get "/login", to: "authentication#login",    as: :login
  post "/authenticate", to: "authentication#create", as: :authenticate
  get "/logout", to: "authentication#destroy",    as: :logout

  get "/about", to: "static_pages#about", as: :about
  get "/terms", to: "static_pages#terms_and_conditions", as: :terms_and_conditions
  get "/privacy", to: "static_pages#privacy", as: :privacy

  resource :memberships,
    only: [:create]

  resources :coupons,
    only: [:index, :show]

  get "/contact-us", to: "contacts#new", as: :new_contact
  resource :contacts, only: [:create]

  resources :password_resets,
    only: [:index, :show, :create, :update],
    path: "forgot-password"
end
