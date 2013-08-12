ShakeNBake::Application.routes.draw do
  resources :users, except: [:index, :destroy]
  
  resources :questions, only: [:show, :new, :create] do
    resources :comments, only: [:create]
    resources :answers, only: [:create]
    resources :votes, only: [:create]
  end

  resources :answers, only: [:show] do
    resources :comments, only: [:create]
    resources :votes, only: [:create]
  end

  resource :session, only: [:new, :create, :destroy]
  root :to => "questions#index"

end
