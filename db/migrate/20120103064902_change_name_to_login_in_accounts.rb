class ChangeNameToLoginInAccounts < ActiveRecord::Migration
  def self.up
    rename_column :accounts, :name, :login
  end

  def self.down
    rename_column :accounts, :login, :name
  end
end
