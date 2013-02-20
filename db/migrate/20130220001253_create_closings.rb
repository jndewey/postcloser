class CreateClosings < ActiveRecord::Migration
  def change
    create_table :closings do |t|
      t.string :name
      t.text :content

      t.timestamps
    end
  end
end
