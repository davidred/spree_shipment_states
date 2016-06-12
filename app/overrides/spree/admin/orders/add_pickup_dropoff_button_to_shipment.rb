Deface::Override.new(:virtual_path => 'spree/admin/orders/_shipment',
  name: 'add_pickup_dropoff_button_to_shipment',
  insert_bottom: 'h1.panel-title',
  text: "<% if shipment.shipped? and can? :update, shipment %>
        <%= link_to Spree.t(:pickup), 'javascript:;', class: 'pickup pull-right btn btn-success', data: { 'shipment-number' => shipment.number } %>
        <div class='clearfix'></div>
      <% end %>
      <% if shipment.picked_up? and can? :update, shipment %>
        <%= link_to Spree.t(:dropoff), 'javascript:;', class: 'dropoff pull-right btn btn-success', data: { 'shipment-number' => shipment.number } %>
        <div class='clearfix'></div>
      <% end %>"
  )
