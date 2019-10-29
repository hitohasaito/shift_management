Rails.application.routes.draw do

  root to: "roots#top"

  get 'roots/top'
  devise_for:users, controllers: {
    registrations: 'users/registrations',
    sessions: "users/sessions",
  }

resources :users, only: [:index, :edit, :update, :destroy]

  resources :shifts do
    resources :comments
  end
  resources :request_shifts


  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
