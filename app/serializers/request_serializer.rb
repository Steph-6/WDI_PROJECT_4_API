class RequestSerializer < ActiveModel::Serializer
  has_one    :event
  # has_one    :user
  attributes :id, :status, :band_name, :bar_name, :bar_id
end
