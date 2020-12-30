Rails.application.routes.draw do

  resources :answers
  devise_for :users, controllers: { omniauth_callbacks: 'stack' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "questions#index"
  #root 'home#index'
  #get 'questions#index' , to: 'stats#new'

  get 'stats', to: 'questions#stats'

  resources :questions do
    member do
      put 'like' => "questions#upvote"
      put 'unlike' => "questions#downvote"
    end
  end

end


