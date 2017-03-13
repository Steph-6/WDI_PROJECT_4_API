class EventSerializer < ActiveModel::Serializer
  has_one    :user
  # has_many   :requests
  attributes :id, :date, :slots_on_offer, :is_expired, :is_at_capacity, :pending_requests, :accepted_requests, :rejected_requests, :number_of_pending_requests, :slots_remaining, :description, :date_string

  def number_of_pending_requests
    object.requests.where(status: "pending").length
  end

  def date_string
    object.date.strftime("At %I:%M on the %m/%d/%Y")
  end

  def slots_remaining
    object.slots_on_offer - object.requests.where(status: "accepted").length
  end

  def pending_requests
    object.requests.where(status: "pending")
  end

  def accepted_requests
    object.requests.where(status: "accepted")
  end

  def rejected_requests
    object.requests.where(status: "rejected")
  end

end
