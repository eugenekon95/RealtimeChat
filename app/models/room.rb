class Room < ApplicationRecord
  has_many :conversants, dependent: :destroy
  has_many :messages, as: :messageable, dependent: :destroy

  validates :name, uniqueness: {case_sensitive: false}
end
