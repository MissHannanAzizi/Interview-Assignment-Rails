class SessionsController < ApplicationController
  # Skip CSRF protection (useful for API, but not recommended for production)
  skip_before_action :verify_authenticity_token, only: [:create]
  
  # Secret key for encoding JWT tokens
  SECRET_KEY = Rails.application.credentials.secret_key_base

  # GET /login
  # Show login form (if using HTML views)
  def new
  end

  # POST /login
  # Authenticate user and start session
  def create
    user = User.find_by(email: params[:email])
    
    if user&.authenticate(params[:password])  # Check if password is correct
      session[:user_id] = user.id  # Store user ID in session
      redirect_to car_batteries_path  # Redirect to battery list page
    else
      render json: { error: "Invalid email or password" }, status: :unauthorized
    end
  end

  # DELETE /logout
  # Log out user by clearing session
  def destroy
    session[:user_id] = nil  # Clear session
    redirect_to root_path  # Redirect to login page
  end

  private

  # Encode JWT token
  def encode_token(payload)
    JWT.encode(payload, SECRET_KEY, 'HS256')
  end
end
