class EventSerializer < ActiveModel::Serializer
  has_one    :user
  has_many   :requests
  attributes :id, :date, :slots_on_offer, :slots_taken, :is_active?
end
