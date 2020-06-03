Rails.application.routes.draw do

  devise_for :users, :controllers => {
    :sessions => 'users/sessions',
    :registrations => 'users/registrations'
   }
  root 'homes#top'
  get  'about' => 'homes#about'
end
