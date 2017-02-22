class User < ApplicationRecord
  has_secure_password
  has_many :events
  has_many :requests
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
  validates_presence_of :is_bar
  validates_presence_of :bar_size, :bar_location, :bar_image, :bar_telephone, :if =>  lambda {|o| o.is_bar == 'yes' }
  validates_presence_of :band_telephone, :artist_id, :if => lambda {|o| o.is_bar == 'no' }

  private
  def user_is_bar
    is_bar == 'yes'
  end

  def user_is_band
    is_bar == 'no'
  end

end
