
class PercentageOff

  def self.percentage_off(price, percent)

    percent_off = percent.to_i/100.0
    deal_price = percent_off * price.to_i
    return deal_price

  end

end