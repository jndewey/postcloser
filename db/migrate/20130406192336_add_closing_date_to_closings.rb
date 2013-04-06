class AddClosingDateToClosings < ActiveRecord::Migration
  def change
    add_column :closings, :closing_date, :date
  end
end
