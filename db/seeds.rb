private
  def add_user email, password, role
    unless User.where(email: email).present?
      user = User.new
      user.email = email
      user.password = password
      user.password_confirmation = password
      user.role = role
      user.save!
    end

    create_logs user, 3 if role == 'employee'
  end

  def create_logs user, n
    (1..n).each do
      TimeLog.create(
        user_id: user.id,
        clock_in: DateTime.now.advance(hours: rand(-7..-2), minutes: rand(0..59)),
        clock_out: DateTime.now.advance(minutes: rand(-30..-1))
      )
    end
  end

  if Rails.env.development?
    add_user 'admin@email.com', 'defaultpass', 'admin'
    add_user 'employee1@email.com', 'defaultpass', 'employee'
    add_user 'employee2@email.com', 'defaultpass', 'employee'
    add_user 'employee3@email.com', 'defaultpass', 'employee'
  end