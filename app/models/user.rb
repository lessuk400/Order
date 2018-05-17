class User < ApplicationRecord
  rolify
  before_create :set_admin!, unless: -> { self.class.exists? }
  mount_uploader :avatar, AvatarUploader
<<<<<<< HEAD
  has_many :orders, dependent: :destroy
=======
  has_many :orders
>>>>>>> 02a7fd6... Orders with OrderMeals
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :email
  validates_presence_of :avatar
  validates_integrity_of :avatar
  validates_processing_of :avatar

  private

  def set_admin!
    add_role(:admin)
  end
  def admin?
    has_role?(:admin)
  end
end
