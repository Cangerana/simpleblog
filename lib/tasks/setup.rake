namespace :setup do
  desc "TODO"
  task admin_users: :environment do
    # Add a system admin user
    user = User.find_by(email: ENV['EMAIL_FROM'])

    if user.present?
      user.update_columns(is_admin: true)

      puts "Added admin permission for user: #{user.email}"
    else
      puts "User with the e-mail '#{ENV['EMAIL_FROM']}' need be register first"
    end
  end
end

