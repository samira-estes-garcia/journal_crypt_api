Rails.application.routes.draw do
  scope '/api' do
    resources :entries
    resources :users
    post 'user_token' => 'user_token#create'
    post 'find_user' => 'users#find'
  end
end
