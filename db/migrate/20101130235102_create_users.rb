class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
       t.string    :login,               :null => false                # optional, you can use email instead, or both
       t.string    :crypted_password,    :null => false                # optional, see below
       t.string    :password_salt,       :null => false                # optional, but highly recommended
       t.string    :persistence_token,   :null => false                # required
       t.string    :perishable_token,    :null => false                # optional, see Authlogic::Session::Perishability
      
      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
