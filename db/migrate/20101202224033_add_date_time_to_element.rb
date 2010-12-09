class AddDateTimeToElement < ActiveRecord::Migration
  def self.up
    add_column :elements, :publish_effective_at, :datetime
  end

  def self.down
    remove_column :elements, :publish_effective_at
  end
end
