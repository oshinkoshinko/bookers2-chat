Rails.application.routes.draw do

devise_for :users, :controllers => {
  :registrations => 'users/registrations'
}
  resources :users, only: [:show,:index,:edit,:update] do
    resource :relationships, only: [:create, :destroy]
    get 'following' => "relationships#following"
    get 'followers' => "relationships#followers"
  end
  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  root 'homes#top'
   get 'home/about' => "homes#show"
   get 'search' => "searchs#search"
   get 'chat/:id' => "chats#show", as: 'chat'
   resources :chats, only: [:create]

end
