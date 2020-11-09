class AddCookStatusToCookies < ActiveRecord::Migration[5.1]
  def change
    add_column :cookies, :cook_status, :integer, default: 0
  end
end
