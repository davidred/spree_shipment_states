class AddPickedUpAtDroppedOffAtToSpreeShipments < ActiveRecord::Migration
  def change
    add_column :spree_shipments, :picked_up_at, :datetime
    add_column :spree_shipments, :dropped_off_at, :datetime
  end
end
