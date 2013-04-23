class CreateClosingItems < ActiveRecord::Migration
  def change
    create_table :closing_items do |t|
      t.string :title
      t.string :author
      t.string :files
      t.string :notes

      t.timestamps
    end
  end
end
