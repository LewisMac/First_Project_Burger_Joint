require_relative( '../db/sql_runner' )

class XForYDeals

  attr_reader(:burger_id, :id, :y_value, :x_value)

  def initialize( options )
    @id = nil || options['id'].to_i
    @x_value = options['x_value']
    @y_value = options['y_value']
    @burger_id = options['burger_id']
  end

  def save()

    burgers = @burger_id.join(',')

    sql = "INSERT INTO x_for_y_deals(x_value, burger_id, y_value)
    VALUES (#{@x_value}, '#{burgers}', #{@y_value})
     RETURNING *"

    results = SqlRunner.run(sql)
    @id = results.first()['id'].to_i
  end

end