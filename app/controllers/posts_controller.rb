class PostsController < ApplicationController
  before_action :logged_in_user, only: [:new, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update, :destroy]

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:notice] = "登録しました"
      redirect_to posts_path
    else
      render 'posts/new'
    end
  end

  def index
    @posts = Post.includes(:user).all.order("created_at DESC").page(params[:page])
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.includes(:user).order("created_at DESC").page(params[:page])
    @comment = @post.comments.build(user_id: current_user.id, post_id: @post.id) if current_user
  end

  def edit
  end

  def update
    if @post.update_attributes(post_params)
      flash[:notice] = "編集しました"
      redirect_to posts_path
    else
      render 'posts/edit'
    end
  end

  def destroy 
    Post.find(params[:id]).destroy
    flash[:notice] = "削除しました"
    redirect_to posts_path
  end

  private
    def post_params
      params.require(:post).permit(:content).merge(user_id: current_user.id)
    end

    # 正しいユーザーかどうか確認
    def correct_user
      @post = Post.find(params[:id])
      if @post.user_id != current_user.id
        flash[:notice] = "権限はありません"
        redirect_to root_url
      end
    end
end