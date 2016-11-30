require_relative("../db/sql_runner")


class JoiningSetPrice

  attr_reader :id
  attr_accessor :burger_id, :price_id

  def initialize( options )
    @id = options['id'].to_i
    @burger_id = options['burger_id'].to_i
    @price_id = options['price_id']
    
  end

  def save(day_id)

    @day = Day.all["#{day_id}".to_i]

    sql = "INSERT INTO joining_set_price (burger_id, price_id, day)
           VALUES ('#{ @burger_id }', '#{ @price_id }', '#{@day}') RETURNING id"
    join = SqlRunner.run( sql ).first
    @id = join['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM joining_set_price"
    joins = SqlRunner.run(sql)
    result = joins.map { |join| JoiningSetPrice.new( join ) }
    return result
  end

  def self.delete_all() 
    sql = "DELETE FROM joining_set_price"
    SqlRunner.run(sql)
  end

  def x_y_information(id)
    sql = "SELECT * FROM x_for_y_deals WHERE id = #{id}"
    results = SqlRunner.run( sql )
    return results
  end

  def split_deals()
    sql = "SELECT * FROM joining_set_price WHERE price_id=#{price_id}"
    results = SqlRunner.run( sql )
    return JoiningSetPrice.new( results.first )
  end

  def burger()
    sql = "SELECT * FROM burgers WHERE id = #{@burger_id}"
    deal_hash = SqlRunner.run(sql).first
    return Burger.new(deal_hash)
  end

end