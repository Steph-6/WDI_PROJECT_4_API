class UserSerializer < ActiveModel::Serializer
  has_many    :events
  # has_many    :requests
  attributes  :id, :email, :name, :is_bar, :band_telephone, :bar_location, :bar_telephone, :bar_size, :bar_image, :my_pending_requests, :my_accepted_requests, :my_rejected_requests, :num_of_pending_requests

  def num_of_pending_requests
    object.requests.where(status: "pending").length
  end

  def my_pending_requests
    object.requests.where(status: "pending")
  end

  def my_accepted_requests
    object.requests.where(status: "accepted")
  end

  def my_rejected_requests
    object.requests.where(status: "rejected")
  end
end
