class CountriesController < ApplicationController
  before_action :authorize, only: [:show, :edit, :update, :destroy]

  def index
    @countries = Country.all
  end

  def show
    @cities = @country.cities
  end

  def new
    @country = Country.new
  end

  def create
    @country = Country.new(country_params)
    if @country.save
      redirect_to countries_path, notice: 'Country was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @country.update(country_params)
      redirect_to countries_path, notice: 'Country was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @country.destroy
    redirect_to countries_path, notice: 'Country was successfully destroyed.'
  end

  private

  def country_params
    params.require(:country).permit(:name, :iso2, :iso3, :region, :phone_code, :latitude, :longitude, :flag)
  end
end
