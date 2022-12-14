Rails.application.routes.draw do
  get 'users/show'
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'teams#new'
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