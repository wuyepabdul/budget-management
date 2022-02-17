class UserTransactionsController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!

  def sum(array)
    array.reduce(0) { |sum, num| sum + num.amount }
  end

  def index
    current_category = current_user.categories.find(params[:category_id])
    @category_transactions = []
    @transactions = current_user.user_transactions.all.order('created_at Desc')
      @transactions.each do |transaction|
        transaction.category_lists.each do |cat|
          if cat == params[:category_id]
            @category_transactions << transaction
          end
        end
      end

      @total_transaction_amount = sum(@category_transactions.uniq)
  end

  def show
  end

  def new
    @category = Category.find(params[:category_id])
  end

  def create
    count = 0
    categories = current_user.categories.all
    current_category = current_user.categories.find(params[:category_id])
    category_ids = user_transaction_params[:category_lists][1..-1]

    user_transaction = current_user.user_transactions.new(name: user_transaction_params[:name], amount:user_transaction_params[:amount], category_lists:category_ids)

    puts '====================================='
      puts 'BEFORE CREATION'
      puts  "current category #{current_category.user_transactions.length}"
      puts  "category list length #{user_transaction.category_lists.length}"
      puts  "category list #{user_transaction.category_lists}"
      puts '====================================='

    return unless can? :create, user_transaction
    # user_transaction.category_lists += category_ids[1..-1]
    if user_transaction.save
      puts '====================================='
      puts 'AFTER CREATION'
      puts  "current category #{current_category.user_transactions.length}"
      puts  "category list length #{user_transaction.category_lists.length}"
      puts  "category list #{user_transaction.category_lists}"
      puts   '====================================='
      categories.each do |category|
        user_transaction.category_lists.each do |cat_id|
          if category.id.to_s == cat_id
            category.user_transactions << user_transaction
            # category.save
          end
        end
      end
      puts '====================================='
      puts 'QUERY DONE'
      puts  "current category #{current_category.user_transactions.length}"
      puts  "category list length #{user_transaction.category_lists.length}"
      puts  "category list #{user_transaction.category_lists}"
      puts   '====================================='

      redirect_to category_user_transactions_path(params[:category_id]), notice: "Transaction Created Successfully"
    else
      redirect_to new_category_user_transaction_path(params[:category.id]), alert: "Error creating transaction"
    end
  end

  def user_transaction_params
    params.require(:add_transaction).permit(:name, :amount, category_lists:[])
  end
end
