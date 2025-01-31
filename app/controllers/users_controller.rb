class UsersController < ApplicationController
  include ApplicationHelper

  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy
  before_action :find_user,      only: [:show, :edit, :update, :destroy]

  def show
  end

  def index
    @users = User.all.order("created_at DESC").page(params[:page])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to @user, notice: '未経験から始めるテニスへようこそ！'
    else
      render 'new'
    end
  end

  def edit
  end
  
  def update
    if @user.update(user_params)
      redirect_to @user, notice: "ユーザプロフィールを更新しました。"
    else
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    flash[:success] = "ユーザを削除しました。"
    redirect_to users_url
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :introduction, :password,
                                   :password_confirmation, :image)
    end
  
    # 正しいユーザーかどうか確認
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    def find_user
      @user = User.find(params[:id])
      if @user.email == "guest@example.com"
        redirect_to users_url, notice: "ゲストユーザです。ユーザ詳細ページの閲覧、更新、削除は出来ません。"
      end
    end
end
