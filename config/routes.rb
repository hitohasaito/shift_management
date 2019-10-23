Rails.application.routes.draw do
  root "shifts#index"
    devise_for:users

  resources :shifts
  resources :request_shifts
  resources :comments
  get 'assigned_works/index'

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

end
