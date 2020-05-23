Rails.application.routes.draw do
  get '/login',to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  namespace :admin do
    resources :users
  end
  root to: "tasks#index" #ルートパス「/」(http://localhost:3000)にアクセスしたとき、タスクの一覧が表示されるように設定。
  resources :tasks do
    post :confirm, action: :confirm_new, on: :new
    post :import, on: :collection
  end
  #resaurceメソッドは、index,show,new,create,edit,update,destoryに関するルーティングを一括して設定してくれる。
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
end
