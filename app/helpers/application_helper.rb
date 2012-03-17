module ApplicationHelper
  def resource_name
    if user_signed_in?
      current_user.name
    else
      "user"
    end
  end
end