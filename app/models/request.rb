class Request < ApplicationRecord
  belongs_to :event
  belongs_to :user
  alias_attribute :band, :user
end
