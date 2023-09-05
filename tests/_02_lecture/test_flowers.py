import pytest
from tests._02_lecture.some_code import get_package_price

package_prices = {"step_1": 3.95, "step_2": 4.95, "step_3": 0}


def test_valid_input() -> None:
    package_1 = get_package_price(10)
    package_2 = get_package_price(30)
    package_3 = get_package_price(45)
    package_4 = get_package_price(-1)

    assert package_1 == package_prices["step_1"]
    assert package_2 == package_prices["step_2"]
    assert package_3 == package_prices["step_3"]
    assert package_4 == package_prices["step_1"]


# A wholesaler sells printer cartridges. The minimum order quantity is 5. 
# There is a 20% discount for orders of 100 or more printer cartridges.
# You have been asked to prepare test cases using various values for the number of printer cartridges ordered.
# What test inputs would you generate using Boundary Value Analysis with 2 and 3 values?

#Partition: integer values between 5 > ?
# Invalid lower boundary:4
# Valid boundaries: 5,6,98, 99
# Valid lower boundaries:5,6
# Invalid boundaries:<4
# Valid upper boundaries:??
# Invalid upper boundary: more that i have numbers
