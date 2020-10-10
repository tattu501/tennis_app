class TermsController < ApplicationController
  before_action :logged_in_user, only: [:new, :edit, :update, :destroy]
  before_action :admin_user,     only: [:new, :edit, :update, :destroy]

  def new
    @term = Term.new
  end

  def create
    @term = Term.new(term_params)
    if @term.save
      flash[:success] = "用語の登録に成功しました！"
      redirect_to @term
    else
      render 'new'
    end
  end

  def index
    @terms = Term.select('id', 'term')
  end

  def show
    @term = Term.find(params[:id])
  end

  def edit
    @term = Term.find(params[:id])
  end
  
  def update
    @term = Term.find(params[:id])
    if @term.update(term_params)
      flash[:success] = "体験記が更新されました！"
      redirect_to @term
    else
      render 'edit'
    end
  end

  def destroy
    Term.find(params[:id]).destroy
    flash[:success] = "用語が削除されました。"
    redirect_to terms_url
  end

  private
    def term_params
      params.require(:term).permit(:term, :explanation, :image)
    end
end
