SpreeShipmentStates
===================

Adds the ability to "pick up" and "drop off" a Spree::Shipment. This modifies the admin panel to not only allow an order to be "Shipped", but additionaly, it can be "Picked Up" and "Dropped Off"

Installation
------------

Add spree_shipment_states to your Gemfile:

```ruby
gem 'spree_shipment_states'
```

Bundle your dependencies and run the installation generator:

```shell
bundle
bundle exec rails g spree_shipment_states:install
```

Testing
-------

First bundle your dependencies, then run `rake`. `rake` will default to building the dummy app if it does not exist, then it will run specs. The dummy app can be regenerated by using `rake test_app`.

```shell
bundle
bundle exec rake
```

When testing your applications integration with this extension you may use it's factories.
Simply add this require statement to your spec_helper:

```ruby
require 'spree_shipment_states/factories'
```

Copyright (c) 2016 [name of extension creator], released under the New BSD License
