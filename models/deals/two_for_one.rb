
class TwoForOne

  def self.two_for_one(price1, price2)

    prices = []
    prices << price1
    prices << price2
    deal_price = prices.max
    return deal_price
  end

end