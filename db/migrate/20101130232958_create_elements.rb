class CreateElements < ActiveRecord::Migration
  def self.up
    create_table :elements do |t|
      t.string  :name
      t.string  :body
      t.integer :owner_id

      t.timestamps
    end
  end

  def self.down
    drop_table :elements
  end
end
