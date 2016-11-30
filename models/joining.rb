require_relative("../db/sql_runner")


class Joining

  attr_reader :id
  attr_accessor :burger_id, :deal_id

  def initialize( options )
    @id = options['id'].to_i
    @burger_id = options['burger_id'].to_i
    @deal_id = options['deal_id']
    
  end

  def save()
    sql = "INSERT INTO joining (burger_id, deal_id)
           VALUES ('#{ @burger_id }', '#{ @deal_id }') RETURNING id"
    join = SqlRunner.run( sql ).first
    @id = join['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM joining"
    joins = SqlRunner.run(sql)
    result = joins.map { |join| Joining.new( join ) }
    return result
  end

  def self.delete_all() 
    sql = "DELETE FROM joining"
    SqlRunner.run(sql)
  end

  def x_y_information(id)
    sql = "SELECT * FROM x_for_y_deals WHERE id = #{id}"
    results = SqlRunner.run( sql )
    return results
  end

  def split_deals()
    sql = "SELECT * FROM joining WHERE deal_id=#{deal_id}"
    results = SqlRunner.run( sql )
    return Joining.new( results.first )
  end

  def burger()
    sql = "SELECT * FROM burgers WHERE id = #{@burger_id}"
    deal_hash = SqlRunner.run(sql).first
    return Burger.new(deal_hash)
  end

  def deal()
    sql =  "SELECT * FROM x_for_y_deals WHERE id = #{@deal_id}"
    deal_hash = SqlRunner.run(sql).first
    return XForYDeals.new(deal_hash)
  end

end