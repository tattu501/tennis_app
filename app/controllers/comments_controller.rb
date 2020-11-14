class CommentsController < ApplicationController
  before_action :logged_in_user, only: [:new, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update, :destroy]
  before_action :set_post

  def edit
    @comment = Comment.find(params[:id])
  end

  def create
    @comment = @post.comments.new(comment_params)
    if @comment.save
      redirect_to post_path(@post.id)
    else
      flash[:alert] = "コメントを(140文字以内で)入力してください。"
      redirect_to post_path(@post.id)
    end
  end

  def update
    if @comment.update_attributes(comment_params)
      redirect_to post_path(@comment.post_id)
    else
      flash[:alert] = "コメントを(140文字以内で)入力してください。"
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to post_path(@post)
  end

  private
    def comment_params
      params.require(:comment).permit(:comment).merge(user_id: current_user.id)
    end

    def authenticate_admin!
      @comment = Comment.find(params[:id])
      
      if @comment.user_id != current_user.id
        flash[:notice] = "権限はありません"
        redirect_to post_path(@comment.post_id)
      end
    end

    # 正しいユーザーかどうか確認
    def correct_user
      @comment = Comment.find(params[:id])
      
      if @comment.user_id != current_user.id
        flash[:notice] = "権限はありません"
        redirect_to post_path(@comment.post_id)
      end
    end

    def set_post
      @post = Post.find(params[:post_id])
    end
end
