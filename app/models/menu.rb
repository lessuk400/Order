class Menu < ApplicationRecord
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
  validates :name, presence: true

  has_many :meals, inverse_of: :menu, dependent: :destroy
  has_many :food_items, through: :meals

  accepts_nested_attributes_for :meals

  def start_time
    date # #Where 'start' is a attribute of type 'Date' accessible through MyModel's relationship
  end
=======
  has_many :meals
  has_many :food_items, through: :meals
  accepts_nested_attributes_for :meals
>>>>>>> 396c301... Wrodi pashe grobana forma
=======
  validates :name, :presence => true
  #validates :price,

=======
  validates :name, presence: true
<<<<<<< HEAD
  # validates :price,
>>>>>>> fe98bb6... Done with Ruboco
=======
>>>>>>> 610a3c3... Callendar

  has_many :meals
  has_many :food_items, through: :meals

  accepts_nested_attributes_for :meals
<<<<<<< HEAD
<<<<<<< HEAD

  private


>>>>>>> 1b41b07... added some interface
=======
>>>>>>> fe98bb6... Done with Ruboco
=======

<<<<<<< HEAD
>>>>>>> 610a3c3... Callendar
=======
  def start_time
    self.date ##Where 'start' is a attribute of type 'Date' accessible through MyModel's relationship
  end
>>>>>>> 756818d... Added calendar
end
