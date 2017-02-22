class Event < ApplicationRecord
  belongs_to :user
  has_many :requests

  validates :date, presence: :true
  # validates :requests, :numericality => { :less_than_or_equal_to => 3 }

  before_create :set_default_flags

  private
  def set_default_flags
    self.is_expired = 'no'
    self.is_at_capacity = 'no'
  end

end
