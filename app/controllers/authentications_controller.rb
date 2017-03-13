class AuthenticationsController < ApplicationController
  skip_before_action :authenticate_user!

  def register
    p user_params
    user = User.new(user_params)
    if user.save
      token = Auth.issue({id: user.id})
      render json: { token: token, user: UserSerializer.new(user) }, status: :ok
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def login
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      token = Auth.issue({id: user.id})
      render json: { token: token, user: UserSerializer.new(user) }, status: :ok
    else
      render json: { errors: ["Invalid login credentials."]}, status: 401
    end
  end

  private
    def user_params
      hash = {}
      if params[:is_bar] == "yes"
        hash.merge! params.slice(:email, :name, :password, :password_confirmation, :is_bar, :bar_location, :bar_telephone, :website, :bar_size, :bar_image)
      else
        hash.merge! params.slice(:email, :name, :password, :password_confirmation, :is_bar, :band_telephone, :band_location, :artist_id)
      end
      hash
    end
end
