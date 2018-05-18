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

  def is_admin?
    has_role? :admin
  end
>>>>>>> 9ac2da0... Added coffe to menu form
end
