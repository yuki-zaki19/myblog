class BlogsController < ApplicationController
  before_action :move_to_index, except: :index

  def index
    @article = Article.all.order("id DESC")
  end

  def new
  end

  def create
    Article.create(blog_params)
  end

  def destroy
    article = Article.find(params[:id])
    article.destroy if article.user_id === current_user.id
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    article = Article.find(params[:id])
    article.update(blog_params) if article.user_id == current_user.id
  end

  private
  def blog_params
    params.permit(:title, :content).merge(user_id: current_user.id)
  end
  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

end
