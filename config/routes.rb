Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
    root :to => "home#index"
	devise_for :doctors, controllers: {
	  registrations: 'doctors/registrations',
    sessions: 'doctors/sessions'
  }
  resources :users
  resources :doctors
  resources :answers
  get 'answers/answers'
end
