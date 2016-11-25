require_relative( '../db/sql_runner' )

class Eatery

  attr_reader :eatery, :id

  def initialize(options)
    @id = nil || options['id'].to_i
    @name = options['name']
  end

  def save()

    sql = "INSERT INTO eateries(name)
    VALUES ('#{ @name }')
     RETURNING *"

    results = SqlRunner.run(sql)
    @id = results.first()['id'].to_i
  end

  def self.delete_all
    sql = "DELETE FROM eateries"
    SqlRunner.run( sql )
  end

end