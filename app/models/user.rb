class User < ApplicationRecord
  has_many :posts, dependent: :destroy

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  validates :first_name, :last_name, :provider, :uid, presence: true
  validates :email, presence: true, length: { maximum: 105 }, uniqueness: { case_sensitive: false }, format: { with: VALID_EMAIL_REGEX }

  def update_info(auth)
    self.first_name = auth.info.first_name
    self.last_name = auth.info.last_name
    self.email = auth.info.email
    self.provider = auth.provider
    self.uid = auth.uid
    self.image = auth.info.image
    self.save
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
