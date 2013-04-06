class AddRelationshipManagerToClosings < ActiveRecord::Migration
  def change
    add_column :closings, :relationship_manager, :string
  end
end
