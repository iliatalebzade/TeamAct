class UsersController < ApplicationController

  before_action :authorize, only: [:dashboard, :show, :edit, :update, :destroy]

  # ----- add these lines here: -----

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
    @countries = Country.all.order(:name)
  end

  def create
    @user = User.new(user_params)
    @user.phone_number = "#{params[:user][:phone_number_country_code]}#{params[:user][:phone_number_digits]}"

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
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_url, notice: 'User was successfully destroyed.'
  end

  def dashboard
  end

private

  def user_params
    # strong parameters - whitelist of allowed fields #=> permit(:name, :email, ...)
    # that can be submitted by a form to the user model #=> require(:user)
    params.require(:user).permit(:first_name, :last_name, :username, :email, :date_of_birth, :country_id, :city_id, :password, :password_confirmation)
  end

# ----- end of added lines -----

end
