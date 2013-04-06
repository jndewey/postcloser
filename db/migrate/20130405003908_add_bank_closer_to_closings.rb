class AddBankCloserToClosings < ActiveRecord::Migration
  def change
    add_column :closings, :Bank_Closer, :string
  end
end
