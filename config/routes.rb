Rails.application.routes.draw do
  devise_for :admins, controllers: {
  	sessions: 'devise/admin/sessions',
  	passwords: 'devise/admin/passwords',
  	registrations: 'devise/admin/registrations'
  }
  devise_for :users, controllers: {
  	sessions: 'devise/users/sessions',
  	passwords: 'devise/users/passwords',
  	registrations: 'devise/users/registrations'
  }
  namespace :user do

  resources :reviews

  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
