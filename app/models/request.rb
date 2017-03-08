class Request < ApplicationRecord
  belongs_to :event
  belongs_to :user

  before_create :set_default_status
  before_create :set_band_name
  before_create :set_bar_name
  before_create :set_bar_id
  after_update  :check_event_accepted_requests

  private
  def set_default_status
    self.status = "pending"
  end

  def set_band_name
    self.band_name = User.find(self.user_id).name
  end

  def set_bar_name
    self.bar_name = Event.find(self.event_id).user.name
  end

  def set_bar_id
    self.bar_id = Event.find(self.event_id).user.id
  end

  def check_event_accepted_requests
    event = Event.find(self.event_id)
    p event, 'event here'
    p event.requests, 'requests here'
    if event.requests.select { |request| request.status == "accepted" }.length >= event.slots_on_offer
      event.update(is_at_capacity: "yes")
      p "#{event.user.name}'s event reached its capacity"
    end
  end

end
