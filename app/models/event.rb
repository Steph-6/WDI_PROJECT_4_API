class Event < ApplicationRecord
  belongs_to :user
  has_many :requests

  validates :date, presence: :true

  before_create :set_default_flags


  private
  def set_default_flags
    self.is_expired = 'no'
    self.is_at_capacity = 'no'
  end

end
