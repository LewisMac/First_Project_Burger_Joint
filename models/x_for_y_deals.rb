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

  def x_y_information()
    sql = "SELECT * FROM x_for_y_deals WHERE id = #{@id}"
    results = SqlRunner.run( sql )
    return results
  end

  def self.all()
    sql = "SELECT * FROM x_for_y_deals"
    results = SqlRunner.run( sql )
    return results.map { |hash| XForYDeals.new( hash ) }
  end

end



