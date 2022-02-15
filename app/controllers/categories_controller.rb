class CategoriesController < ApplicationController
  def index
    @categories = current_user.categories.all
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
      redirect_to categories_path, notice: "Category Created Successfully"
    else
      redirect_to new_category_path, alert: "Error, Could Not Create Category"
    end
  end

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
