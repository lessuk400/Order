class User < ApplicationRecord
  rolify
<<<<<<< HEAD
  before_create :set_admin!, unless: -> { self.class.exists? }
=======
  before_create :set_role
>>>>>>> fe98bb6... Done with Ruboco
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

<<<<<<< HEAD
  def set_admin!
    add_role(:admin)
  end
  def admin?
    has_role?(:admin)
=======
  def set_role
    if id == 1
       add_role(:admin)
    else
      add_role(:customer)
    end
>>>>>>> fe98bb6... Done with Ruboco
  end
end
