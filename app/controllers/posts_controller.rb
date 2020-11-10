class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:notice] = "登録しました"
      redirect_to root_url
    else
      render 'posts/new'
    end
  end

  private
    def post_params
      params.require(:post).permit(:content).merge(user_id: current_user.id)
    end
end