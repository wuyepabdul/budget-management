class CategoriesController < ApplicationController
  def index
    @categories = current_user.categories.all
    @transactions = current_user.user_transactions.all.order('created_at Desc')
    # category_transactions = []
    # user_cat_transactions = []

    # @categories.each do |category|
    #   @transactions.each do |tran|
    #     tran.category_lists.each do |cat_id|
    #         if cat_id == category.id.to_s 
    #             category_transactions << tran
    #             # category.user_transactions.push(tran)
    #         end 
    #     end
    #     category.user_transactions += category_transactions
    #   end 
    # end  

      # @total_transaction_amount = sum(@category_transactions.uniq)
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
