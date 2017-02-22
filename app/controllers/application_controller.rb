class ApplicationController < ActionController::API
  before_action :authenticate_user!
  before_action :update_expired_events

  def authenticate_user!
    render json: { errors: ["Unauthorized"] }, status: 401 unless user_signed_in?
  end

  def user_signed_in?
    !!current_user
  end

  def current_user
    @current_user ||= User.find(decoded_token[:id]) if id_found?
  rescue
    nil
  end

  private

    def id_found?
      token && decoded_token && decoded_token[:id]
    end

    def decoded_token
      @decoded_token ||= Auth.decode(token) if token
    end

    def token
      @token ||= if request.headers['Authorization'].present?
        request.headers['Authorization'].split.last
      end
    end

    def update_expired_events
      events = Event.where(is_expired: "no").select { |event| event.date < Time.now }
      events.each do |event|
        event.update(is_expired: "yes")
        p "#{event.user.name}'s event has expired"
      end
    end
end
