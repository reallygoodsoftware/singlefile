require 'bcrypt'

class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true,
            format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password_digest, presence: true

  def password=(new_password)
    @password = new_password
    self.password_digest = BCrypt::Password.create(new_password)
  end

  def password
    @password
  end

  def authenticate(password)
    BCrypt::Password.new(password_digest) == password
  end

  # Full name combining first and last name
  def name
    [first_name, last_name].compact.join(' ').presence
  end

  # Display name - full name if available, otherwise derive from email
  def display_name
    name || email.split('@').first.split('.').map(&:capitalize).reverse.join(' ')
  end
end
