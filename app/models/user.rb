class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates_presence_of :is_bar?
  validates_presence_of :bar_size, :bar_location, :bar_image, :bar_telephone, :if =>  lambda {|o| o.is_bar? == 'yes' }
  validates_presence_of :band_telephone, :band_image, :artist_id, :if => lambda {|o| o.is_bar? == 'no' }

  private
  def user_is_bar?
    is_bar? == 'yes'
  end

  def user_is_band?
    is_bar? == 'no'
  end

end
