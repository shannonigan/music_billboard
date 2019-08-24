Rails.application.routes.draw do
  root 'static_pages#home'

  # get '/about', to: 'static_pages#about'

  resources :pages


  get '/billboards/:id/songs' => 'billboards#list', :as => :billboardsongs
  
  resources :billboards do
    resources :songs
  end

  resources :artists do
    resources :songs 
  end

end
