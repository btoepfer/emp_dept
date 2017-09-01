class User < ApplicationRecord

  attr_accessor :token
  
  has_secure_password

  validates :full_name, presence: true
  validates :email, presence: true
  validates_uniqueness_of :email, case_sensitive: false
  validates_format_of :email, with: /@/

  before_save :downcase_email

  def downcase_email
    self.email = self.email.delete(' ').downcase
  end
  
end
