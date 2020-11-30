Rails.application.routes.draw do
  scope '/api' do
    resources :users
    resources :entries
    #resources :users, except: :show
    # resources :users, only: :show do 
    #   resources :entries
    # end
    post 'user_token' => 'user_token#create'
    post 'find_user' => 'users#find'
  end
end
