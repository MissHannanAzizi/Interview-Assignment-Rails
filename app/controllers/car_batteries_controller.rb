class CarBatteriesController < ApplicationController

  # GET /car_batteries
  # Displays a list of all car batteries
  def index
    @car_batteries = CarBattery.all
  end

  # GET /car_batteries/:id
  # Displays details of a specific car battery
  def show
    @car_battery = CarBattery.find(params[:id])
  end

  # GET /car_batteries/new
  # Renders a form for creating a new car battery
  def new
    @car_battery = CarBattery.new
  end

  # POST /car_batteries
  # Creates a new car battery and saves it to the database
  def create
    @car_battery = CarBattery.new(car_battery_params)
    if @car_battery.save
      redirect_to car_batteries_path, notice: "Car battery created successfully!"
    else
      render :new
    end
  end

  # GET /car_batteries/:id/edit
  # Renders a form for editing an existing car battery
  def edit
    @car_battery = CarBattery.find(params[:id])
  end

  # PATCH/PUT /car_batteries/:id
  # Updates an existing car battery
  def update
    @car_battery = CarBattery.find(params[:id])
    if @car_battery.update(car_battery_params)
      redirect_to car_batteries_path, notice: "Car battery updated successfully!"
    else
      render :edit
    end
  end

  # DELETE /car_batteries/:id
  # Deletes a car battery
  def destroy
    @car_battery = CarBattery.find(params[:id])
    @car_battery.destroy
    redirect_to car_batteries_path, notice: "Car battery deleted successfully!"
  end

  private

  # Strong parameters to allow only specified attributes
  def car_battery_params
    params.require(:car_battery).permit(:brand, :model, :voltage, :price, :warranty)
  end
end
