class AddBorrDetailsToClosings < ActiveRecord::Migration
  def change
    add_column :closings, :borrower_counsel_one, :string
    add_column :closings, :borrower_counsel_two, :string
  end
end
