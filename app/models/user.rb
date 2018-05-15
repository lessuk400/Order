class User < ApplicationRecord
  rolify
  before_create :setRole
  mount_uploader :avatar, AvatarUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of  :email
  validates_presence_of   :avatar
  validates_integrity_of  :avatar
  validates_processing_of :avatar

  private
  def setRole
    if self.id == 1
      self.add_role(:admin)
    else
      self.add_role(:customer)
    end
  end
end
