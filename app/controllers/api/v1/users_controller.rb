class Api::V1::UsersController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    user = current_user
    location = Location.find_or_create_by(zip: fetch_params['zip'])
    if user.update(phone_number: fetch_params['phoneNumber'],
                  commute_one_start: fetch_params['commuteOneStart'],
                  commute_one_end: fetch_params['commuteOneEnd'],
                  commute_two_start: fetch_params['commuteTwoStart'],
                  commute_two_end: fetch_params['commuteTwoEnd'])
      UsersLocation.new(user: user, location: location)
      render json: {
        status: 201,
        message: "Update successful"
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
    params.require(:profile).permit(:zip, :phoneNumber, :commuteOneStart, :commuteOneEnd, :commuteTwoStart, :commuteTwoEnd)
  end
end
