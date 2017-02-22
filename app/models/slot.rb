class Slot < ApplicationRecord
  belongs_to :event
  belongs_to :user
  has_many :requests
end
