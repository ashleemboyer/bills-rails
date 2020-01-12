Rails.application.routes.draw do

  resources :bills do
    member do
      patch :pay
    end
  end
  
  root "bills#index"

end
