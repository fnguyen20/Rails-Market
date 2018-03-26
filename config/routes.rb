Rails.application.routes.draw do
  resources :topics do
    scope module: :topics do
      resources :listings, except: [:new]
    end
  end
  get 'listings/new', to: 'topics/listings#new', as: 'new_listing'
  post 'listings', to: 'topics/listings#create', as: 'create_listing'


  devise_for :users, controllers: { registrations: 'registrations' }
  root to: 'static#home'
end