Spree::Shipment.class_eval do
  scope :dropped_off, -> { with_state('dropped_off') }
  scope :picked_up, -> { with_state('picked_up') }

  # shipment state machine (see http://github.com/pluginaweek/state_machine/tree/master for details)
  state_machine initial: :pending, use_transactions: false do
    event :pickup do
      transition from: :shipped, to: :picked_up
    end
    after_transition to: :picked_up, do: :after_pickup

    event :dropoff do
      transition from: :picked_up, to: :dropped_off
    end
    after_transition to: :dropped_off, do: :after_dropoff
  end

  def after_pickup
    Spree::PickupHandler.new(self).perform
  end

  def after_dropoff
    Spree::DropoffHandler.new(self).perform
  end

  #    # Determines the appropriate +state+ according to the following logic:
  #
  # pending     unless order is complete and +order.payment_state+ is +paid+
  # shipped     if already shipped (ie. does not change the state)
  # picked_up   if already picked up
  # dropped_off if already dropped off
  # ready       all other cases
  def determine_state(order)
    return 'canceled' if order.canceled?
    return 'pending' unless order.can_ship?
    return 'pending' if inventory_units.any? &:backordered?
    return 'shipped' if state == 'shipped'
    return 'picked_up' if state == 'picked_up'
    return 'dropped_off' if state == 'dropped_off'
    order.paid? || Spree::Config[:auto_capture_on_dispatch] ? 'ready' : 'pending'
  end
end
