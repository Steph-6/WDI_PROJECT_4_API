class SlotSerializer < ActiveModel::Serializer
  attributes :id, :duration, :description, :slots_on_offer, :slots_taken, :is_active?
end
