Rails.application.routes.draw do

get '/shop' => 'shop#buy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
get '/' => 'pages#home'
get '/about' => 'pages#about'

get '/messages' => 'messages#index'
get '/messages/show/:id' => 'messages#show'
get '/messages/edit/:id' => 'messages#edit'
get '/messages/new' => 'messages#newMessage'
get '/messages/destroy/:id' => 'messages#destroyMessage'
post '/messages' => 'messages#createMessage'
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


get '/charges/show/:id' => 'product#show'
get '/charges/new' => 'product#new'

resources :users, :charges
end
