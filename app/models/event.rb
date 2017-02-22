class Event < ApplicationRecord
  belongs_to :user
  alias_attribute :bar, :user
  has_many :slots

  validates :date, presence: :true
  # validates :requests, :numericality => { :less_than_or_equal_to => 3 }
end
