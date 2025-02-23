class UsersController < ApplicationController
  # Skip CSRF protection (useful for API, but not recommended for production)
  skip_before_action :verify_authenticity_token
  
  # Uncomment this to require login before accessing user list
  # before_action :authenticate_user, only: [:index]

  # Secret key for encoding JWT tokens
  SECRET_KEY = Rails.application.credentials.secret_key_base

  # GET /signup
  # Show signup form (if using HTML views)
  def new
    @user = User.new
  end

  # GET /users
  # Retrieve all users and return as JSON
  def index
    @users = User.all
    render json: @users
  end

  # POST /signup
  # Create a new user and return a JWT token
  def create
    user = User.new(user_params)
    
    if user.save
      token = encode_token({ user_id: user.id })  # Generate JWT token
      render json: { message: "User created successfully", token: token }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  # Strong parameters: Allow only permitted attributes
  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end

  # Encode JWT token
  def encode_token(payload)
    JWT.encode(payload, SECRET_KEY, 'HS256')
  end

  # Ensure user is logged in before accessing certain actions
  def authenticate_user
    unless session[:user_id]
      redirect_to login_path, notice: "Please log in first."
    end
  end
end
