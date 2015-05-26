class RemoveColumnFromTable < ActiveRecord::Migration
  def change
    remove_column :tables, :region, :string
  end
end
