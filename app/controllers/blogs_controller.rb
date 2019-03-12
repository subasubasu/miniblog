class BlogsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  protect_from_forgery :except => [:destroy]

  def index
    @blogs = Article.includes(:user).all.order("id DESC")
  end

  def new
    @article = Article.new
  end

  def show
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(create_params)
    @article.save(validate: false)
    redirect_to action: :index
  end

  def destroy
    article = Article.find(params[:id])
    article.destroy
    redirect_to action: :index
  end

  def edit
    @article = Article.find(params[:id])
    @article.destroy
  end

  def update
    article = Article.new(create_params)
    article.save(validate: false)
    redirect_to action: :index
  end

  private
  def create_params
    params.require(:article).permit(:text)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end


