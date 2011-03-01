class User     < ActiveRecord::Base; end
class Account < ActiveRecord::Base; end

class SingluizeUserAccounts < ActiveRecord::Migration
  def self.up
    User   .delete_all
    Account.delete_all
    drop_table :accounts_users
    add_column :users, :account_id, :integer
  end

  def self.down
    raise ActiveRecord::IrreversibleMigration.new "table \"accounts_users\" has been dropped and its data destroyed -- there's no rolling back this one."
  end
end
