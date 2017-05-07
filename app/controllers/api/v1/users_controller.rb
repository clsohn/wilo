class Api::V1::UsersController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    user = current_user
    location = Location.find_or_create_by(city: fetch_params['city'],
          state: fetch_params['homeState'], zip: fetch_params['zip'])
    if user.update(phone_number: fetch_params['phoneNumber'])
      UsersLocation.create(user_id: user.id, location_id: location.id)
      render json: {
        status: 201,
        message: "Update successful",
        user_id: user.id
      }.to_json
    else
      render json: {
        status: 500,
        error: user.errors
      }.to_json
    end
  end

  private

  def fetch_params
    params.require(:profile).permit(:city, :homeState, :zip, :phoneNumber)
  end
end
