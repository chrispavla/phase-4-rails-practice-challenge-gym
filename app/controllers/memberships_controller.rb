class MembershipsController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, with: :record_invalid

  def index 
    memberships = Membership.all 
    render json: memberships, status: :ok
  end

  def create 
    membership = Membership.create!(membership_params)
    render json: membership, status: :created
  end

  private 

  def membership_params
    params.permit(:gym_id, :client_id, :charge)
  end

  def record_invalid(invalid)
    render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
  end

end
