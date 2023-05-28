class CountryController < ApplicationController

  before_action :authorize, only: [:dashboard, :show, :edit, :update, :destroy]

  # ----- add these lines here: -----

  def index
    @countries = Country.all
    render json: @countries
  end

  def show
  end

  def edit
  end

  def update
    if @country.update(country)
      redirect_to @country, notice: 'Country was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @country.destroy
    redirect_to countries_url, notice: 'Country was successfully destroyed.'
  end

  def dashboard
  end

end
