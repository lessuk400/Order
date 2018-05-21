class User < ApplicationRecord
  rolify
  before_create :set_role
  mount_uploader :avatar, AvatarUploader
  has_many :orders
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :email
  validates_presence_of :avatar
  validates_integrity_of :avatar
  validates_processing_of :avatar

  private

  def set_role
    add_role :customer
    add_role :admin if !self.class.exists?
  end
end
