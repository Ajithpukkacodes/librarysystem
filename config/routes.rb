Rails.application.routes.draw do
 resources :users
 resources :sessions
 resources :books
 get    'login'   => 'sessions#new', :as => :loginpage
 get    'view'    => 'sessions#show',:as => :viewpage
 delete 'logout', to: 'sessions#destroy', as: 'logout'
 get 'books/:id/borrow' => 'books#borrow', :as => :borrow_book
 get 'books/:id/return' => 'books#return', :as => :return_book
   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root "sessions#new"
end
