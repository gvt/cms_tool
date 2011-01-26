class ChangedSlugColumnToSubdomain < ActiveRecord::Migration
  def self.up
    rename_column :accounts, :slug, :subdomain
  end

  def self.down
    rename_column :accounts, :subdomain, :slug
  end
end
