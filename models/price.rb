require_relative( '../db/sql_runner' )

class Price

  attr_reader :price_value, :id

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

  def self.find(price_id)
      sql = "SELECT * FROM prices WHERE id=#{price_id}"
      results = SqlRunner.run( sql )
      return Price.new( results.first )
    end

end