module ApplicationHelper
  def is_admin?
    current_user && current_user.uid == "18310167"
  end


end
