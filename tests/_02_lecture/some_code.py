def get_package_price(price: float) -> float:
    if price > 0 and price <= 20:
        return 3.95
    elif price > 20 and price <= 40:
        return 4.95
    return 0

