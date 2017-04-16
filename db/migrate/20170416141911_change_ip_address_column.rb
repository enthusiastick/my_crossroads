class ChangeIpAddressColumn < ActiveRecord::Migration[5.0]
  def up
    remove_column :receipts, :ip_address
    add_column :receipts, :ip_address, :cidr
  end
  def down
    remove_column :receipts, :ip_address
    add_column :receipts, :ip_address, :string
  end
end
