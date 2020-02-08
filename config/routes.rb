Rails.application.routes.draw do

  root 'home#top'
  get "/home/about", to:'home#about'

  devise_for :admins, controllers: {
  	sessions: 'devise/admin/sessions',
  	passwords: 'devise/admin/passwords',
  	registrations: 'devise/admin/registrations'
  }
  devise_for :users, controllers: {
    sessions: 'devise/user/sessions',
    passwords: 'devise/user/passwords',
    registrations: 'devise/user/registrations'
  }


  namespace :user do

  resources :reviews
  resource :user, only: [:show, :edit, :update, :destroy]

  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
