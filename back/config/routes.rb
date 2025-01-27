Rails.application.routes.draw do
  root to: "posts#index"
  devise_for :users

  resources :posts do
    resources :comments, only: [:create, :edit, :update, :destroy]
  end
end
