module ApplicationHelper
  def full_name(user)
    "OUT | #{user.first_name} #{user.last_name}" if user.present?
  end

  def estimated?(book, user)
    book.ratings.where(user_id: user.id).present?
  end
end
