# Create default user if none exists
if User.count == 0
  user = User.create!(
    email: 'admin@example.com',
    password: 'password123',
    first_name: 'Admin',
    last_name: 'User'
  )
  puts "Created default user: #{user.email} / password123"
  puts "Display name: #{user.display_name}"
else
  puts "Users already exist. Skipping seed."
  puts "Current users:"
  User.all.each do |user|
    puts "  - #{user.email} (#{user.display_name})"
  end
end
