Rails.application.routes.draw do

  root 'home#top'
  get "/home/about", to:'home#about'
  get 'user/users/leave', to:'user/users#leave'

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

   resources :users, only: [:show, :edit, :update, :destroy] do
    resource :relationships, only: [:create, :destroy]
    get :follows, on: :member
    get :followers, on: :member
  end
   resources :theaters
   resources :reviews do
     resource :favorites, only: [:create, :destroy]
   end

  end

  namespace :admin do
    root 'users#index'
    resources :users, only: [:index, :show, :edit, :update]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
