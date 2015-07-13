class AddTableIdToMessages < ActiveRecord::Migration
  def change
    add_reference :messages, :table, index: true
    add_foreign_key :messages, :tables
  end
end
