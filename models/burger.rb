require_relative( '../db/sql_runner' )

class Burger

  attr_reader( :name, :id , :eatery_id, :price_id)

  def initialize( options )
    @id = nil || options['id'].to_i
    @name = options['name']
    @eatery_id = options['eatery_id']
    @price_id = options['price_id']
  end

  def save()

    sql = "INSERT INTO burgers(name, eatery_id, price_id)
    VALUES ('#{@name}', '#{@eatery_id}', '#{@price_id}')
     RETURNING *"

    results = SqlRunner.run(sql)
    @id = results.first()['id'].to_i
  end

  def self.find( id )
    sql = "SELECT * FROM burgers WHERE id=#{id}"
    results = SqlRunner.run( sql )
    return Burger.new( results.first )
  end

  

  def self.all()
    sql = "SELECT * FROM burgers"
    results = SqlRunner.run( sql )
    return results.map { |hash| Burger.new( hash ) }
  end

  def self.delete_all
    sql = "DELETE FROM burgers"
    SqlRunner.run( sql )
  end
end