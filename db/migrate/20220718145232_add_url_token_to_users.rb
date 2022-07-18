class AddUrlTokenToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :url_token, :string
  end
end
