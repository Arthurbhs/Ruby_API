Rails.application.routes.draw do
  resources :kinds

  resources :contacts do
    resources :kind, only: [:show]
    resources :kind, only: [:show], path: 'relationships/kind'
  

    resources :phones, only: [:show]
    resources :phones, only: [:show], path: 'relationships/phones'

    resources :address, only: [:show]
    resources :address, only: [:show], path: 'relationships/address'
  
  end  
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end