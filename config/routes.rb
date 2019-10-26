Rails.application.routes.draw do
  root "shifts#top"

  devise_for:users, controllers: {
    registrations: 'users/registrations',
    sessions: "users/sessions",
  }

  resources :users, only: [:index, :edit, :update]

  resources :shifts do
    resources :comments
    collection do
    patch :release
    patch :nonrelease
    end
  end
  resources :request_shifts
  get 'assigned_works/index'

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
