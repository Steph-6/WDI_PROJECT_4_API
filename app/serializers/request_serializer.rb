class RequestSerializer < ActiveModel::Serializer
  has_one    :event
  has_one    :user
  attributes :id, :status
end
