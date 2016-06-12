Spree::Api::V1::ShipmentsController.class_eval do

  before_action :find_and_update_shipment, only: [:pickup, :dropoff, :ship, :ready, :add, :remove]

  def pickup
    @shipment.pickup! unless @shipment.picked_up?
    respond_with(@shipment, default_template: :show)
  end

  def dropoff
    @shipment.dropoff! unless @shipment.dropped_off?
    respond_with(@shipment, default_template: :show)
  end
end