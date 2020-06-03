Rails.application.routes.draw do

  devise_for :users, :controllers => {
    :sessions => 'users/sessions',
    :registrations => 'users/registrations'
   }
  root 'homes#top'
  get  'about' => 'homes#about'

  scope module: :user do
    resources :users,only: [:show,:edit,:update] do
  		collection do
  	     get 'quit'
  	     patch 'out'
  	  end
    end
  end
end
