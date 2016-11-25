require('pry-byebug')

class XForY

def self.x_for_y(x, y, options)
  total_cost = 0

  options.sort!
  y.times do
    # binding.pry
    total_cost += options.last.to_i
    options.pop
  end
  return total_cost
end

end






# def self.X_for_Y(x, y, options)

  #   options = []
  #   deal_price = options.max
  #   return deal_price
