Rails.application.routes.draw do
  root "shifts#index"

  devise_for :users, controllers: {
          sessions: 'users/sessions'
        }
  resources :shifts
  resources :request_shifts

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

end
