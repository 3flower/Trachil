Rails.application.routes.draw do



  # デバイス
  devise_for :users, :controllers => {
    :sessions => 'users/sessions',
    :registrations => 'users/registrations',
   }

  root 'homes#top'
  get  'about' => 'homes#about'
  # get 'users' => 'user/users#top'

  # ユーザー
  scope module: :user do
    resources :users,only: [:show,:edit,:update] do
  		member do
  	    get 'quit'
  	    patch 'out'
  	  end
    end
    resources :travels do
      resources :comments, only: [:create, :destroy]
  	  resource :likes, only: [:create, :destroy]
    end
  end

  resources :relationships, only: [:create, :destroy]

  # エラー４０４
  get '*not_found' => 'application#routing_error'
  post '*not_found' => 'application#routing_error'

end
