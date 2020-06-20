class Place < ApplicationRecord
  has_many :place_permissions
  has_many :users, through: :place_permissions, dependent: :destroy
end
