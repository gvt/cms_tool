class RenameOwner < ActiveRecord::Migration
  def self.up
    rename_column :elements, :owner_id  , :account_id
  end

  def self.down
    rename_column :elements, :account_id, :owner_id
  end
end
