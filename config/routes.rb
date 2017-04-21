Rails.application.routes.draw do

get '/shop' => 'shop#buy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
get '/' => 'pages#home'
get '/messages' => 'messages#index'
get '/messages/show/:id' => 'messages#show'
get '/messages/edit/:id' => 'messages#edit'
get '/messages/new' => 'messages#new'
get '/messages/destroy/:id' => 'messages#destroy'
post '/messages' => 'messages#create'
patch '/messages/update/:id' => 'messages#update'

get '/signup' => 'users#new'
get '/login' => 'sessions#new'
post '/login' => 'sessions#create'
delete '/logout' => 'sessions#destroy'

get '/orders' => 'orders#new'
post '/orders' => 'orders#create'
delete '/orders' => 'orders#destroy'
put '/orders/increase/:id' => 'orders#increase'
put '/orders/decrease/:id' => 'orders#decrease'


get '/charges/show/:id' => 'charges#show'

resources :users, :charges
end
