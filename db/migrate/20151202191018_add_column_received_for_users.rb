class AddColumnReceivedForUsers < ActiveRecord::Migration
  def change
    add_column :users, :received, :boolean
  end
end
