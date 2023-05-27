class CategoryController < ApplicationController

  before_action :authorize, only: [:dashboard, :show, :edit, :update, :destroy]

  # ----- add these lines here: -----

  def index
    @categories = Category.all
  end

  def show
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      # If category saves in the db successfully:
      flash[:notice] = "Category created successfully!"
      redirect_to root_path
    else
      # If user fails model validation - probably a bad password or duplicate email:
      flash.now.alert = "Oops, couldn't create category. Please try again."
      render :new
    end
  end

  def edit
  end

  def update
    if @category.update(category)
      redirect_to @category, notice: 'Category was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to categories_url, notice: 'Category was successfully destroyed.'
  end

  def dashboard
  end

private

  def category_params
    # strong parameters - whitelist of allowed fields #=> permit(:name, :email, ...)
    # that can be submitted by a form to the user model #=> require(:user)
    params.require(:user).permit(:name, :parent_category_id)
  end

# ----- end of added lines -----

end
