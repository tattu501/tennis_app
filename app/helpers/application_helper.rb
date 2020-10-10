module ApplicationHelper
  # 管理者かどうか確認
  def admin_user?
    current_user.admin?
  end

  # 渡されたユーザーがカレントユーザーであればtrueを返す
  def current_user?(user)
    user && user == current_user
  end
end
