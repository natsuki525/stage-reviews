Rails.application.routes.draw do

  root 'home#top'
  get "/home/about", to:'home#about'
  delete 'users/:id/update_dl', to:'user/users#update_dl', as: 'users_update_dl'

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


  scope module: :user do
    resources :users, only: [:show, :edit, :update, :destroy] do
      resources :theaters, only: [:index, :edit, :update]
      resources :favorites, only: [:index]
      resources :clips, only: [:index]
      resource :relationships, only: [:create, :destroy]
      get :follows, on: :member
      get :followers, on: :member
      member do
        get '/leave', to:'users#leave'
      end
    end
    # resources :theaters
    resources :reviews do
      resource :favorites, only: [:create, :destroy]
      resource :clips, only: [:create, :destroy]
    end

  end

  namespace :admin do
    root 'users#index'
    resources :users, only: [:index, :show, :edit, :update]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
