require_relative('deals/two_for_one.rb')
require_relative('burger')
require( 'pry-byebug' )

require_relative( '../db/sql_runner' )

class XForYDeals

  attr_reader(:burger_id, :id, :y_value, :x_value, :eatery_id, :day)

  def initialize( options )
    @id = nil || options['id'].to_i
    @x_value = options['x_value']
    @y_value = options['y_value']
    @burger_id = options['burger_id']
    @eatery_id = options['eatery_id']
  end

  def save(day_id)

    @day = Day.all["#{day_id}".to_i]

    burgers = @burger_id.join(',')

    sql = "INSERT INTO x_for_y_deals(x_value, burger_id, y_value, eatery_id, day)
    VALUES (#{@x_value}, '#{burgers}', #{@y_value}, '#{@eatery_id}', '#{@day}')
     RETURNING *"

    results = SqlRunner.run(sql)
    @id = results.first()['id'].to_i
  end

  def find_burgers_in_deal(deal_id)

    sql = "SELECT * FROM x_for_y_deals WHERE id = #{deal_id}"
    results = SqlRunner.run( sql )
    return XForYDeals.new( results.first )
  end

  def x_y_information(id)
    sql = "SELECT * FROM x_for_y_deals WHERE id = #{id}"
    results = SqlRunner.run( sql )
    return results
  end

  def self.all()
    sql = "SELECT * FROM x_for_y_deals"
    results = SqlRunner.run( sql )
    return results.map { |hash| XForYDeals.new( hash ) }
  end

  def calculate_price()
    
    all_burger_costs = []
    all_price_id = []

    sql1 = "SELECT x_value FROM x_for_y_deals WHERE id = #{@id}"
    x_value = SqlRunner.run( sql1 ).first['x_value'].to_i

    sql2 = "SELECT y_value FROM x_for_y_deals WHERE id = #{@id}"
    y_value = SqlRunner.run( sql2 ).first['y_value'].to_i

    sql3 = "SELECT burger_id FROM x_for_y_deals WHERE id = #{@id}"
    burger_ids = SqlRunner.run( sql3 ).first['burger_id'].split(',')
    
    for id in burger_ids
      
      sql4 = "SELECT price_id FROM burgers WHERE id = #{id}"
      all_price_id << SqlRunner.run( sql4 )[0]["price_id"]
    end

    for id in all_price_id
      price_sql = "SELECT price_value FROM prices WHERE id = #{id}"
      all_burger_costs << SqlRunner.run(price_sql)[0]["price_value"]
    end
    
    calc_price = XForY.calculate(x_value, y_value, all_burger_costs)

    sql3 = "INSERT INTO x_for_y_deals (price) VALUES (#{calc_price}) returning *"
    results = SqlRunner.run( sql3 )
    @id = results.first()['id'].to_i
    return calc_price
  end

  def self.find_by_day( day )
    sql = "SELECT * FROM x_for_y_deals WHERE day='#{day}'"
    results = SqlRunner.run( sql )
    return results.map { |hash| XForYDeals.new( hash ) }
  end
end



