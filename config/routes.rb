Watchout::Application.routes.draw do
  root 'application#root'

  get 'streams/:id' => 'streams#show'
  
end
