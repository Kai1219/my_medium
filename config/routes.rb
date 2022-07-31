Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  
  namespace :api do
    post :upload_image, to: 'utils#upload_image'

    # /api/users/:id/follow
    resources :users, only: [] do 
      member do
        post :follow
      end
    end

    
    resources :stories, only: [] do 
      member do
        #/api/stories/id/clap
        post :clap
        #/api/stories/id/bookmark
        post :bookmark
      end
    end
  end

  resources :users, only: [] do
    collection do
      get :pricing  # /users/pricing
      get :payment # /users/payment
      post :pay  # /users/pay
    end
  end

  #/stories/id/clap
  resources :stories do
    resources :comments, only: [:create]
  end
  
  # /@作者帳號/文章標題-123
  get '@:username/:story_id', to: 'pages#show', as: 'story_page'

  # /@作者帳號/
  get '@:username', to: 'pages#user', as: 'user_page'

  get '/demo', to: 'pages#demo'

  root 'pages#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
