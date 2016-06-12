module Spree
  class DropoffHandler
    def initialize(shipment)
      @shipment = shipment
    end

    def perform
      send_dropped_off_email
      @shipment.touch :dropped_off_at
      update_order_shipment_state
    end

    private
      def send_dropped_off_email
        Spree::ShipmentMailer.dropped_off_email(@shipment.id).deliver_later
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
