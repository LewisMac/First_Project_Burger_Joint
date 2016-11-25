require_relative( '../db/sql_runner' )

class Price

  attr_reader :cost, :id

  def initialize(options)
    @id = nil || options['id'].to_i
    @price_value = options['price_value'].to_i
  end

  def save()

    sql = "INSERT INTO prices(price_value)
    VALUES ('#{ @price_value }')
     RETURNING *"

    results = SqlRunner.run(sql)
    @id = results.first()['id'].to_i
  end

  def self.delete_all
    sql = "DELETE FROM prices"
    SqlRunner.run( sql )
  end

end