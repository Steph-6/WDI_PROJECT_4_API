class Event < ApplicationRecord
  belongs_to :user_id
  alias_attribute :bar, :user
  has_many :requests

  validates :date, presence: :true
end
