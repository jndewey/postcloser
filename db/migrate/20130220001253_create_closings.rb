class CreateClosings < ActiveRecord::Migration
  def change
    create_table :closings do |t|
      t.string :name
      t.string :teammember
      t.string :dealname
      t.integer :user_id
      t.text :content

      t.timestamps
    end
  end
end
