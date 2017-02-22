class RequestsController < ApplicationController
  before_action :set_request, only: [:update_accept, :update_reject]

  # # GET /requests
  # def index
  #   @requests = Request.all
  #
  #   render json: @requests
  # end
  #
  # # GET /requests/1
  # def show
  #   render json: @request
  # end

  # POST /requests
  def create
    @request = current_user.requests.new(request_params)

    if @request.save
      render json: @request, status: :created, location: @request
    else
      render json: @request.errors, status: :unprocessable_entity
    end
  end

  # # PATCH/PUT /requests/1
  # def update
  #   if @request.update(request_params)
  #     render json: @request
  #   else
  #     render json: @request.errors, status: :unprocessable_entity
  #   end
  # end
  #
  # # DELETE /requests/1
  # def destroy
  #   @request.destroy
  # end

  def update_accept
    if @request.update(status: "accepted")
      render json: @request
    else
      render json: @request.errors, status: :unprocessable_entity
    end
  end

  def update_reject
    if @request.update(status: "rejected")
      render json: @request
    else
      render json: @request.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request
      @request = Request.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def request_params
      params.require(:request).permit(:user_id, :event_id, :status)
    end
end
