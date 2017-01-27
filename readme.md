# Vending Machine Kata Solution

<https://github.com/guyroyse/vending-machine-kata>

## Overview

There is no runtime environment at this point. The code is exercised via the RSpec
tests. The integration specs in `vending_machine_spec.rb` demonstrate the functionality
of each feature (accept coins, select product, etc)

`VendingMachine` provides the public interface of the vending machine. All other
classes are internal implementation.

## Steps to run the code

This code requires a standard Ruby development environment. The basic components are:

- **Ruby 2.1** (or newer).
- **Build tools**. XCode or GCC and development libraries. Needed to build gems.
- **Bundler 1.12** (or newer). This can be installed with `gem install bundler`

Start by installing dependencies.

    cd [folder where you cloned the code]
    bundle

Then run the tests

    bin/rspec

Or use Guard to run the tests automatically as you work

    bin/guard

## TODO

Not all features of the vending machine have been implemented. Here's what's remaining.

### Return Coins

`CoinBox` needs to track which coins have been inserted. A `return_coins` method will
deposit these coins into the coin return. A "coin return" button should be added to
`VendingMachine` and wired to `CoinBox`.

Alternatively, we could use `CoinBox#make_change` to return coins. While the customer
would get back the amount they inserted, they may not get back the same coins.

### Sold Out

`ProductDispenser` needs to track product inventory. `dispense` should return `{ status: :sold_out }`
when the product is unavailable. We also need to update `Display` and `VendingMachine` to handle
this condition.

### Exact Change Only

`CoinBox` needs to track the coins it has available for making change, removing coins from
this inventory whenever `make_change` is called.

Assuming the products and prices are fixed, the most change the machine will need to make is
$0.10 - for the case where the customer only has quarters and wants to buy candy. `CoinBox` will
need 1 dime or 2 nickels for this. As long as `CoinBox` has 1 dime or 2 nickels, it can make change.

`VendingMachine` should check `CoinBox` after each transaction and update `Display` as needed.

This can be solved in a more general way. `VendingMachine` should give `CoinBox` the price
list when it's initialized. Then `CoinBox` can calculate the price that's farthest away from the
next increment of $0.25 and determine what coins are needed to make change.
