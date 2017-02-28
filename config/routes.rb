Rails.application.routes.draw do
  constraints(:host => /^www\./) do
    get "(*x)" => redirect { |params, request|
      URI.parse(request.url).tap {|url| url.host.sub!('www.', '') }.to_s
    }
  end

  ActiveAdmin.routes(self)

  # root to: "home#index"
  root to: "events#index"

  get  "/about/us", to: "about#us", as: :about_us
  post "/authenticate", to: "authentication#create", as: :authenticate
  get  "/contact-us", to: "contacts#new", as: :new_contact
  get  "/login", to: "authentication#login", as: :login
  get  "/logout", to: "authentication#destroy", as: :logout
  get  "/privacy", to: "static_pages#privacy", as: :privacy
  get  "/jobs", to: "static_pages#jobs", as: :jobs
  get  "/terms", to: "static_pages#terms_and_conditions", as: :terms_and_conditions

  resource :contacts, only: [:create]

  resources :coupons,
    only: [:index, :show]

  resources :sponsors,
    only: [:index, :show]

  resources :events,
    only: [:index]

  resources :sponsors,
    only: [:index, :show]

  resources :memberships,
    only: [:index, :create, :new]

  resources :password_resets,
    only: [:index, :show, :create, :update],
    path: "forgot-password"

  resources :receipts, only: [:index, :create]
  resources :receipts, only: [:show],
    defaults: { format: 'pdf' },
    :constraints => { :format => 'pdf' }

  resources :dashboards, only: [:index] do
    get 'membership', on: :collection
    get 'welcome', on: :collection
  end

end
