module ApplicationHelper
  def full_name(user)
    "OUT | #{user.first_name} #{user.last_name}" if user.present?
  end
end
