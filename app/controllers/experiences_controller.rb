class ExperiencesController < ApplicationController
  before_action :logged_in_user, only: [:new, :edit, :update, :destroy]
  before_action :admin_user,     only: [:new, :edit, :update, :destroy]

  def new
    @experience = Experience.new
  end

  def create
    @experience = Experience.new(experience_params)
    if @experience.save
      flash[:success] = "体験記の登録に成功しました！"
      redirect_to @experience
    else
      render 'new'
    end
  end

  def index
    @experiences = Experience.select('id', 'year', 'month')
  end

  def show
    @experience = Experience.find(params[:id])
  end

  def edit
    @experience = Experience.find(params[:id])
  end
  
  def update
    @experience = Experience.find(params[:id])
    if @experience.update(experience_params)
      flash[:success] = "体験記が更新されました！"
      redirect_to @experience
    else
      render 'edit'
    end
  end

  def destroy
    Experience.find(params[:id]).destroy
    flash[:success] = "体験記が削除されました。"
    redirect_to experiences_url
  end

  private
    def experience_params
      params.require(:experience).permit(:year, :month, :explanation, :image)
    end
end
