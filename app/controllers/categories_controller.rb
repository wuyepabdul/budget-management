class CategoriesController < ApplicationController
  def index
  end

  def show
  end

  def new
    @category = Category.new
  end

  def create
    category = current_user.categories.new(category_params)

    return unless can? :create, category

    if category.save
      flash.now[:notice] = 'Category Created Successfully'
      redirect_to categories_path, notice: "Category Created Successfully"
      # redirect_to root_path, notice: "Category Created Successfully"
    else
      # redirect_to categories_path, alert: "Error, Could Not Create Category"
    flash.now[:alert] = category.errors
    end
  end

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
