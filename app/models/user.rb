# frozen_string_literal: true

class User < ApplicationRecord
  rolify

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :avatar, AvatarUploader

  has_many :orders, dependent: :destroy

  validates_presence_of :email
  validates_presence_of :avatar
  validates_integrity_of :avatar
  validates_processing_of :avatar

  before_create :set_admin!, unless: -> { self.class.exists? }

  def admin?
    has_role?(:admin)
  end

  private

  def set_admin!
    add_role(:admin)
  end
end
