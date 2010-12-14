class RenameUserIdToOwnerId < ActiveRecord::Migration
  def self.up
    change_column :elements, :user_id, :integer
    rename_column :elements, :user_id, :owner_id
  end

  def self.down
    rename_column :elements, :owner_id, :user_id 
    change_column :elements, :user_id, :string
  end
end
