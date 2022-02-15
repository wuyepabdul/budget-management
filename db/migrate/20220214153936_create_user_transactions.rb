class CreateUserTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :user_transactions do |t|
      t.string :name, null:false, default: ""
      t.integer :amount, null:false, default: 0
      t.string :category_lists, null:false, default: ''
      t.references :user, null:false, foreign_key: true
      t.timestamps
    end
  end
end
