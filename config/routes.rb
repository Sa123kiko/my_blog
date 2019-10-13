Rails.application.routes.draw do
#削除して下2行追記
  resources :posts
  root 'posts#index'
end
