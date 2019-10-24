Rails.application.routes.draw do
  root "shifts#top"

  devise_for:users
  get 'users/index'

  resources :shifts do
    resources :comments
  end
  resources :request_shifts
  get 'assigned_works/index'

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
