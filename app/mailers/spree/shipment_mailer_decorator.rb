Spree::ShipmentMailer.class_eval do
  def picked_up_email(shipment, resend=false)
    @shipment = shipment.respond_to?(:id) ? shipment : Spree::Shipment.find(shipment)
    subject = (resend ? "[#{Spree.t(:resend).upcase}] " : '')
    subject += "#{Spree::Store.current.name} #{Spree.t('shipment_mailer.pickup_email.subject')} ##{@shipment.order.number}"
    mail(to: @shipment.order.email, from: from_address, subject: subject)
  end

  def dropped_off_email(shipment, resend=false)
    @shipment = shipment.respond_to?(:id) ? shipment : Spree::Shipment.find(shipment)
    subject = (resend ? "[#{Spree.t(:resend).upcase}] " : '')
    subject += "#{Spree::Store.current.name} #{Spree.t('shipment_mailer.dropoff_email.subject')} ##{@shipment.order.number}"
    mail(to: @shipment.order.email, from: from_address, subject: subject)
  end
end