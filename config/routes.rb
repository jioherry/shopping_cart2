Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "products#index"

  resources :products, only: [:index, :show] do
    post :add_to_cart, on: :member
  end

  resource :cart
  resources :orders do
    post :checkout, on: :member
  end


  post 'pay2go/return'
  post 'pay2go/notify'

  namespace :admin do
    root 'orders#index'
    resources :products
    resources :orders
  end

end
