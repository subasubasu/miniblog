Rails.application.routes.draw do

  devise_for :users

  root 'blogs#index'
  get 'blogs/new' => 'blogs#new'
  post 'blogs' => 'blogs#create'
  get 'blogs/:id' => 'blogs#show'
  get 'blogs/:id/edit' => 'blogs#edit'
  patch 'blogs/:id' => 'blogs#update'
  delete 'blogs/:id' => 'blogs#destroy'

end
