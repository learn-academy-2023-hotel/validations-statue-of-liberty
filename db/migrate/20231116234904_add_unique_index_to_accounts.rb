class AddUniqueIndexToAccounts < ActiveRecord::Migration[7.0]
  def change
    # add_index :accounts, [:address_number, :address_name, :zip], unique: true
  end
end
