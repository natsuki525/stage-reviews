Rails.application.routes.draw do

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

  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
