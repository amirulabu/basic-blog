Rails.application.routes.draw do
  root to: "posts#index" #setting the root of website to posts/index

  resources :posts #provide all the action avaliable in views posts (new,index,create,show,edit,update,destroy)
end