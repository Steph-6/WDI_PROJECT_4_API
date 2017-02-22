class UserSerializer < ActiveModel::Serializer
  has_many    :events
  has_many    :requests
  attributes  :id, :email, :name, :is_bar, :band_telephone, :artist_id, :bar_location, :bar_telephone, :bar_size, :bar_image, :events
end
