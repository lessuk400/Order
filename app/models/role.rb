<<<<<<< HEAD

class Role < ApplicationRecord
  has_and_belongs_to_many :users, join_table: :users_roles

  belongs_to :resource,
              polymorphic: true,
              optional:    true

  validates :resource_type,
             inclusion: { in: Rolify.resource_types },
             allow_nil: true

  scopify

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======

class Role < ApplicationRecord
  has_and_belongs_to_many :users, join_table: :users_roles

  belongs_to :resource,
              polymorphic: true,
              optional:    true

  validates :resource_type,
             inclusion: { in: Rolify.resource_types },
             allow_nil: true

  scopify
>>>>>>> fe98bb6... Done with Ruboco
=======

=======
>>>>>>> 4d9bc9a... Menu check
  def is_admin?
    has_role? :admin
  end
>>>>>>> 9ac2da0... Added coffe to menu form
=======
  def is_admin?
    has_role? :admin
  end
>>>>>>> 8a4fae3... Fixes
=======
  def is_admin?
    has_role? :admin
  end
>>>>>>> d1aaad3... Fixes
end
