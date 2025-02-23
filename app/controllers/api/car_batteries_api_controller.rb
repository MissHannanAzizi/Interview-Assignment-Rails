# app/controllers/api/car_batteries_api_controller.rb
class Api::CarBatteriesApiController < ApplicationController
  
  # GET /api/car_batteries_api
  # Retrieves all car batteries
  def index
    @car_batteries = CarBattery.all
    render json: @car_batteries
  end

  # GET /api/car_batteries_api/:id
  # Retrieves a specific car battery by ID
  def show
    @car_battery = CarBattery.find_by(id: params[:id])
    
    if @car_battery
      render json: @car_battery
    else
      render json: { error: "Car Battery not found" }, status: :not_found
    end
  end

  # POST /api/car_batteries_api
  # Creates a new car battery entry
  def create
    @car_battery = CarBattery.new(car_battery_params)

    if @car_battery.save
      render json: @car_battery, status: :created
    else
      render json: { errors: @car_battery.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/car_batteries_api/:id
  # Updates an existing car battery entry (currently incomplete)
  def update
    @car_battery = CarBattery.find_by(id: params[:id])
    render json: @car_battery
  end

  # DELETE /api/car_batteries_api/:id
  # Deletes a car battery entry
  def destroy
    @car_battery = CarBattery.find_by(id: params[:id])

    if @car_battery.destroy
      render json: { message: "Car Battery deleted successfully" }, status: :ok
    else
      render json: { error: "Failed to delete Car Battery" }, status: :unprocessable_entity
    end
  end

  private

  # Strong parameters to ensure only allowed attributes are processed
  def car_battery_params
    params.require(:car_battery).permit(:brand, :model, :voltage, :price, :warranty)
  end
end
