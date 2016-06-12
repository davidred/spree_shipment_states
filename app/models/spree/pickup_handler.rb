module Spree
  class PickupHandler
    def initialize(shipment)
      @shipment = shipment
    end

    def perform
      send_picked_up_email
      @shipment.touch :picked_up_at
      update_order_shipment_state
    end

    private
      def send_picked_up_email
        Spree::ShipmentMailer.picked_up_email(@shipment.id).deliver_later
      end

      def update_order_shipment_state
        order = @shipment.order

        new_state = OrderUpdater.new(order).update_shipment_state
        order.update_columns(
                             shipment_state: new_state,
                             updated_at: Time.current,
                             )
      end
  end
end
