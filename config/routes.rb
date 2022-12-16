Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'users/show'
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  post '/homes/guest_sign_in', to: 'homes#guest_sign_in'
  post '/homes/admins_guest_sign_in', to: 'homes#admins_guest_sign_in'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'homes#show'
  resources :users, :only => [:show]

  resources :comments, only: [:index]

  resources :teams do
    resources :assigns, only: %i[ create destroy ]
    resources :songs do
      resources :comments
    end
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end

  # root 'comments#index'
  #   resources :comments
  #   resources :teams 
  #   resources :songs do
  #     resources :comments
#   end