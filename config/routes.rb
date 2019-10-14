Rails.application.routes.draw do

  devise_for :users
  resources :shifts
  resources :request_shifts

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

end
