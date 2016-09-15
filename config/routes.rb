Rails.application.routes.draw do
  resources :records
  root 'home#index'
  resources :posts


  devise_for :users, controllers: { registrations: "registrations" }


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
