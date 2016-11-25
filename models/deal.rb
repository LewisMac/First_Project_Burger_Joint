require_relative( '../db/sql_runner' )
require_relative( 'days.rb' )

class Deal

  attr_reader(:deal_type, :id , :deal_price1, :deal_price2)

  def initialize( options )
    @id = nil || options['id'].to_i
    @burger_id = options['burger_id']
    @eatery_id = options['eatery_id']
    @deal_type = options['deal_type']
    # @deal_price1 = options['deal_price1']
    # @deal_price2 = options['deal_price2']
  end

  def save()

    sql = "INSERT INTO deals(deal_type, burger_id, eatery_id)
    VALUES ('#{@deal_type}', '#{@burger_id}', '#{@eatery_id}')
     RETURNING *"

    results = SqlRunner.run(sql)
    @id = results.first()['id'].to_i
  end

  def information()
    array = []
    sql = 
    "SELECT name FROM burgers WHERE id=#{@burger_id};"
    sql2 = 
    "SELECT name FROM eateries WHERE id=#{@eatery_id};"
    array << SqlRunner.run(sql).first
    array << SqlRunner.run(sql2).first
    return array
  end

  def self.find( id )
    sql = "SELECT * FROM deals WHERE id=#{id}"
    results = SqlRunner.run( sql )
    return Deal.new( results.first )
  end

  def self.all()
    sql = "SELECT * FROM deals"
    results = SqlRunner.run( sql )
    return results.map { |hash| Deal.new( hash ) }
  end



  def self.delete_all
    sql = "DELETE FROM deals"
    SqlRunner.run( sql )
  end
end