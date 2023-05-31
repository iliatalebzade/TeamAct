class UsersController < ApplicationController

  protect_from_forgery with: :exception
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
    @user = User.new(user_params)
    @user.role = Role.find(1) # admin for now
    # store all emails in lowercase to avoid duplicates and case-sensitive login errors:
    @user.email.downcase!
    result = @user.save
    if result
      phone_number = PhoneNumber.new(number: "#{params[:user][:phone_number_country_code]}#{params[:user][:phone_number_digits]}")
      phone_number.country = Country.find(params[:user][:country_id])
      phone_number.user = @user
      result = phone_number.save
      puts result
      if !result
        if phone_number.errors.any?
          phone_number.errors.full_messages.each do |message|
            puts message
          end
        end
      end
      @user.phone_number = phone_number
      # If user saves in the db successfully:
      flash[:notice] = "Account created successfully!"
      redirect_to root_path
    else
      if @user.errors.any?
        @user.errors.full_messages.each do |message|
          puts message
        end
      end
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
    respond_to do |format|
      format.html
      format.json { render json: {available: user.nil?} }
    end
  end

private

  def user_params
    # strong parameters - whitelist of allowed fields #=> permit(:name, :email, ...)
    # that can be submitted by a form to the user model #=> require(:user)
    parsed_params = params.require(:user).permit(:first_name, :last_name, :username, :email, :date_of_birth, :gender, :phone_number_country_code, :phone_number_digits, :country_id, :city_id, :password, :password_confirmation)

    # Convert the date_of_birth parameter to the desired format
    parsed_params[:date_of_birth] = Date.strptime(params[:user][:date_of_birth], "%m/%d/%Y")

    parsed_params
  end

# ----- end of added lines -----

end
