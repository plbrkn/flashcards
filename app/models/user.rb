# frozen_string_literal: true

# User
class User < ApplicationRecord
  authenticates_with_sorcery!
  has_many :cards, dependent: :destroy

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 8 }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true
end
