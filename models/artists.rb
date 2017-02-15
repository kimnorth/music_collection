require_relative('../sql_runner.rb')

class Artist

  def initialize(options)
    @name = options["name"]
    @artist_id = options["artist_id"] if options["artist_id"]
  end

  def save()

    sql = "INSERT INTO artists 
    (name)
    VALUES
    ('#{@name}') RETURNING artist_id;"

    results = SqlRunner.run(sql)
    @artist_id = results.first['artist_id'].to_i

  end

end