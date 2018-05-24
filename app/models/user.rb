class User < ApplicationRecord
  rolify
<<<<<<< HEAD
<<<<<<< HEAD
  before_create :set_admin!, unless: -> { self.class.exists? }
=======
  before_create :set_role
>>>>>>> fe98bb6... Done with Ruboco
=======
  before_create :set_admin!, unless: -> { self.class.exists? }
>>>>>>> 41ec95b... Code review
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
<<<<<<< HEAD
  def set_admin!
    add_role(:admin)
  end
  def admin?
    has_role?(:admin)
=======
  def set_role
<<<<<<< HEAD
    if id == 1
       add_role(:admin)
    else
      add_role(:customer)
    end
>>>>>>> fe98bb6... Done with Ruboco
=======
    add_role :customer
<<<<<<< HEAD
    add_role :admin if !self.class.exists?
>>>>>>> 1b0a9e6... Added pundit
=======
    add_role :admin unless self.class.exists?
>>>>>>> 4d9bc9a... Menu check
=======
  def set_admin!
    add_role :admin
>>>>>>> 41ec95b... Code review
  end
end
