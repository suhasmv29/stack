Rails.application.routes.draw do
  resources :questiontags
  resources :questions
  resources :answers
  devise_for :users, controllers: { omniauth_callbacks: 'stack' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "questions#index"
  #root 'home#index'
  #root 'votes#new'
  

end
