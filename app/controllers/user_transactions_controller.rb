class UserTransactionsController < ApplicationController
  def index
    @transactions = current_user.user_transactions.all.order('created_at Desc')
    @total_transaction_amount = @transactions.sum('amount')
  end

  def show
  end

  def new
    @category = Category.find(params[:category_id])
  end

  def create
    category_ids = user_transaction_params[:category_lists]

    category = current_user.categories.find(params[:category_id])
    user_transaction = current_user.user_transactions.new(user_transaction_params)

    return unless can? :create, user_transaction
    user_transaction.category_lists += category_ids[1..-1]
    if user_transaction.save
      redirect_to category_user_transactions_path(params[:category_id]), notice: "Transaction Created Successfully"
    else
      redirect_to new_category_user_transaction_path(params[:category.id]), alert: "Error creating transaction"
    end
  end

  def user_transaction_params
    params.require(:add_transaction).permit(:name, :amount, category_lists:[])
  end
end
