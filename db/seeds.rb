private
  def add_user(email, password, role)
    unless User.where(email: email).present?
      user = User.new
      user.email = email
      user.password = password
      user.password_confirmation = password
      user.role = role
      user.save!
    end
  end

  if Rails.env.development?
    add_user 'admin@email.com', 'defaultpass', 'admin'
  end