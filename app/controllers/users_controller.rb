class UsersController < ApplicationController

  before_action :authorize, only: [:dashboard, :show, :edit, :update, :destroy]

  # ----- add these lines here: -----

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
    @countries = Country.all.order(:name)
  end

  def create
    byebug
    @user = User.new(user_params)
    phone_number = PhoneNumber.create(country_id: params[:user][:country_id])
    phone_number.number = "#{params[:user][:phone_number_country_code]}#{params[:user][:phone_number_digits]}"
    phone_number.user = @user
    @user.phone_number = phone_number
    # store all emails in lowercase to avoid duplicates and case-sensitive login errors:
    @user.email.downcase!

    if @user.save
      # If user saves in the db successfully:
      flash[:notice] = "Account created successfully!"
      redirect_to root_path
    else
      # If user fails model validation - probably a bad password or duplicate email:
      flash.now.alert = "Oops, couldn't create account. Please make sure you are using a valid email and password and try again."
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_url, notice: 'User was successfully destroyed.'
  end

  def dashboard
  end

  def check_username_availability
    user = User.find_by(username: params[:username])
    render json: {avaiable: user.present?}
  end

private

  def user_params
    # strong parameters - whitelist of allowed fields #=> permit(:name, :email, ...)
    # that can be submitted by a form to the user model #=> require(:user)
    params.require(:user).permit(:first_name, :last_name, :username, :email, :date_of_birth, :gender, :phone_number_country_code, :phone_number_digits, :country_id, :city_id, :password, :password_confirmation)
  end

# ----- end of added lines -----

end
