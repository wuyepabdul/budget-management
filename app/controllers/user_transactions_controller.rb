class UserTransactionsController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!

  def sum(array)
    array.reduce(0) { |sum, num| sum + num.amount }
  end

  def index
    @category_transactions = []
    @transactions = current_user.user_transactions.all.order('created_at Desc')
    @transactions.each do |transaction|
      transaction.category_lists.each do |cat|
        @category_transactions << transaction if cat == params[:category_id]
      end
    end

    @total_transaction_amount = sum(@category_transactions.uniq)
  end

  def show; end

  def new
    @category = Category.find(params[:category_id])
  end

  def create
    categories = current_user.categories.all
    category_ids = user_transaction_params[:category_lists][1..]
    t_name = user_transaction_params[:name]
    t_amount = user_transaction_params[:amount]

    user_transaction = current_user.user_transactions.new(name: t_name,
                                                          amount: t_amount,
                                                          category_lists: category_ids)

    return unless can? :create, user_transaction

    if user_transaction.save
      categories.each do |category|
        user_transaction.category_lists.each do |cat_id|
          category.user_transactions << user_transaction if category.id.to_s == cat_id
        end
      end
      redirect_to category_user_transactions_path(params[:category_id]), notice: 'Transaction Created Successfully'
    else
      redirect_to new_category_user_transaction_path(params[:category.id]), alert: 'Error creating transaction'
    end
  end

  def user_transaction_params
    params.require(:add_transaction).permit(:name, :amount, category_lists: [])
  end
end
