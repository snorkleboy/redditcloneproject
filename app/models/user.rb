# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string
#  password_digest :string
#  session_token   :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
   validates :username, :password_digest, :session_token, presence: true
   validates :password, length: { minimum: 6, allow_nil: true }

  after_initialize :ensure_session_token

  has_many :subs,
           class_name: :Sub,
           primary_key: :id,
           foreign_key: :moderator_id
  has_many :posts,
           class_name: :Post,
           primary_key: :id,
           foreign_key: :author_id,
           inverse_of: :author

  attr_reader :password

  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64
  end

  def reset_token
    self.session_token = SecureRandom.urlsafe_base64
    self.save
    self.session_token
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrpyt::Password.new(self.password_digest).is_password?(password)
  end

  def self.find_by_cred(username, password)
    user = User.find_by(username: username)

    if user && user.is_password?(password)
      return user
    end
  end

end
