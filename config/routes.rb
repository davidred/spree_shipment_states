Spree::Core::Engine.routes.draw do
  put '/api/shipments/:id/pickup' => 'api/shipments#pickup', defaults: { format: 'json' }, as: 'pickup_api_shipment'
  put '/api/shipments/:id/dropoff' => 'api/shipments#dropoff', defaults: { format: 'json' }, as: 'dropoff_api_shipment'
end
