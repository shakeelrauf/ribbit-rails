class User < ApplicationRecord
  has_secure_password
  validates :name, presence: true
  validates :username, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true, format: { with: /@/ }
  has_many :ribbits
  before_validation :prep_email
  before_save :create_avatar_url
  

  private
  def create_avatar_url
    self.avatar_url = "http://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(self.email)}?s=50"
  end
 
  def prep_email
    self.email = self.email.strip.downcase if self.email
  end
end
