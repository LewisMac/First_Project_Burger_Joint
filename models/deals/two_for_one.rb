require('pry-byebug')

class XForY

  def self.calculate(x, y, options)
    total_cost = 0
    option_array = []

    for option in options
      option_array << option.to_i
    end

    option_array.sort!
    y.times do
      total_cost += option_array.last.to_i
      option_array.pop
    end
    return total_cost
  end

end






# def self.X_for_Y(x, y, options)

  #   options = []
  #   deal_price = options.max
  #   return deal_price
