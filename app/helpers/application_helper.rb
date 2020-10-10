module ApplicationHelper
  # 管理者かどうか確認
  def admin_user?
    current_user.admin?
  end
end
