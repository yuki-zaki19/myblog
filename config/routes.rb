Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'blogs#index' # 一覧画面
  get '/new' => 'blogs#new' # 投稿画面
  post '/complete' => 'blogs#create' # 投稿機能
  post '/login' => 'blogs#login' # ログイン画面
  delete '/:id' => 'blogs#destroy' #削除機能
  get '/:id/edit' => 'blogs#edit' #編集画面
  patch '/:id' => 'blogs#update' #編集機能 
  # <div class="box_title"><span>point</span></div><div class="box">
  # patchを使用する</div>

end
