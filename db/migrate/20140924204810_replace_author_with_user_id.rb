class ReplaceAuthorWithUserId < ActiveRecord::Migration
  def change
    remove_column :articles, :author
    add_column :articles, :user_id, :integer
  end
end
