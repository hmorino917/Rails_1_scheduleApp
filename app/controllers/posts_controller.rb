class PostsController < ApplicationController

  def index
    @posts = Post.all
    @total_posts = Post.count
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params.require(:post).permit(:title, :start_date, :end_date, :all_day, :memo))
    if @post.save
      flash[:notice] = "スケジュールメモを新規作成しました"
      redirect_to :posts
    else
      render "new"      
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(params.require(:post).permit(:title, :start_date, :end_date, :all_day, :memo))
      flash[:notice] = "IDが「#{@post.id}」のスケジュール内容を更新しました"
      redirect_to :posts
    else
      render "edit"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "予定を削除しました"
    redirect_to :posts
  end
  
end
