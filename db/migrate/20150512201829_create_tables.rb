class CreateTables < ActiveRecord::Migration
  def change
    create_table :tables do |t|
      t.string :title
      t.string :cuisine
      t.string :region
      t.references :user, index: true
      t.string :show
      t.string :search

      t.timestamps null: false
    end
    add_foreign_key :tables, :users
  end
end
