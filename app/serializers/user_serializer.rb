class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :name, :is_bar, :band_telephone, :artist_id, :bar_location, :bar_telephone, :bar_size, :bar_image
end
