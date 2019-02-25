Rails.application.routes.draw do
  root 'lists#index'
  
  resources :lists do 
    resources :artists
  end

  resources :artists do
    resources :songs
  end

  resources :songs do
    
    resources :artists
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
