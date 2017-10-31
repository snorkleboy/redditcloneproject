Rails.application.routes.draw do
  resources :users
  resources :subs do
    resources :posts do
      resources :comments, only: [:new]
    end
  end
  resource :session

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
