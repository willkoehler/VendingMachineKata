# Vending Machine Kata Solution

<https://github.com/guyroyse/vending-machine-kata>

## Overview

There is no runtime environment (or "main" function) at this point. The code
is exercised via the RSpec tests.

`VendingMachine` provides the public interface of the vending machine. All other
classes are internal implementation.

## Steps to run the code

Start by installing necessary gems

    cd [folder where you cloned the code]
    bundle

Then run the tests

    bin/rspec

Or use guard to run the tests automatically as you work

    bundle exec guard
