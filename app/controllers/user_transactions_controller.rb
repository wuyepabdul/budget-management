class UserTransactionsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @category = Category.find(params[:category_id])
    @user_transaction = UserTransaction.new
  end

  def create
    user_transaction = current_user.user_transactions.new(user_transaction_params)

    return unless can? :create, user_transaction

    if user_transaction.save
      redirect_to root_path, notice: "Transaction Created Successfully"
    else
      redirect_to category_user_transactions(category.id), alert: "Error creating transaction"
    end
  end

  def user_transaction_params
    params.require(:add_transaction).permit(:name, :amount, :category_lists)
  end
end
