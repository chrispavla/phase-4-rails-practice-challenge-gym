class GymsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def index 
    gyms = Gym.all 
    render json: gyms, status: :ok 
  end

  def show
    gym = Gym.find(params[:id])
    render json: gym, status: :ok 
  end

  def create
    gym = Gym.create!(gym_params)
    render json: gym, status: :created
  end

  def update
    gym = Gym.find(params[:id])
    gym.update!(gym_params)
    render json: gym, status: :accepted
  end

  def destroy 
    gym = Gym.find(params[:id])
    gym.destroy 
    head :no_content
  end

  private 

  def gym_params
    params.permit(:name, :address)
  end

  def record_not_found(error)
    render json: {error: error.message}, status: :not_found
  end

end
