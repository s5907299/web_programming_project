Rails.application.routes.draw do
  get 'animes',to:"main#main"
  get 'anime_news',to:"main#main"
  get 'source0s',to:"main#main"
  get 'platform1s',to:"main#main"
  get 'comment_news',to:"main#main"
  get 'comment_animes',to:"main#main"

  resources :source0s
  resources :platform1s
  resources :comment_news
  resources :comment_animes
  resources :anime_news
  resources :animes
  resources :users
  #resources :my_lists
  #resources :like_news
  #resources :like_animes
  #resources :follows


  get 'login',to:"main#login"
  post 'login',to:"main#login_submit"

  get 'logout',to:"main#logout"

  get 'register',to:"main#register"
  post 'register',to:"main#register_submit"

  get '',to:"main#main"
  get 'main',to:"main#main"
  get 'home',to:"main#home"
  get 'feed',to:"main#feed"
  get 'my_list',to:"main#my_list"

  get 'main/home',to:"main#main"
  get 'main/feed',to:"main#feed"
  get 'main/my_list',to:"main#my_list"

  get 'main/anime',to:"main#anime"
  get 'main/news',to:"main#news"
  get 'main/platform',to:"main#platform"

  get 'like_anime/:anime_id',to:"main#like_anime"
  get 'follow_anime/:anime_id',to:"main#follow_anime"
  get 'likenews/:anime_news_id',to:"main#like_news"
  get 'add_to_list/:anime_id',to:"main#add_to_list"

  #post 'source0s/:platform_id',to:"source0s#create"
  get 'publish/:anime_id',to:"source0s#new"
  get 'platform',to:"main#platform"

  get 'comment_anime/:anime_id',to:"comment_animes#new"
  get 'comment_anime_news/:anime_news_id',to:"comment_news#new"

  #get '',to:"main#"
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
