class AddApiKeyToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :translation_api_key, :string
  end
end
