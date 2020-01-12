Rails.application.routes.draw do

  resources :accounts
  resources :bills do
    member do
      patch :pay
    end
  end
  
  root "bills#index"

end
