class PostsController < ApplicationController

  def new
    @post = Post.new  #フォーム用の空のインスタンスを生成する｡
  end

  def create
    @post = Post.new(post_params) #ストロングパラメータを引数に
    @post.save  #saveをしてデータベースに保存する｡
    redirect_to @post  #showページにリダイレクト
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to @post #showページにリダイレクト
  end


  def index
    @posts = Post.all  #記事一覧用
    @new_posts = Post.all  #最新記事用
    @author = Author.first  
  end

  private

  def post_params  #ストロングパラメータを定義する
    params.require(:post).permit(:title, :body, :category)
  end
end  
