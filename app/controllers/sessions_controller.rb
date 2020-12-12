class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # ユーザーログイン後にユーザー情報のページにリダイレクトする
      log_in user
      redirect_to user
    else
      flash[:alert] = 'メールアドレスまたはパスワードが誤っております。'
      render 'new'
    end
  end

  def guest_login
    user = User.find_or_create_by!(name: 'ゲストユーザ', email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
    log_in user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
