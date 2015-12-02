class AddColumnMailgunForUsers < ActiveRecord::Migration
  def change
    add_column :users, :mailgun, :string
  end
end
