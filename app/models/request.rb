class Request < ApplicationRecord
  belongs_to :event_id
  belongs_to :user_id
  alias_attribute :band, :user_id
end
