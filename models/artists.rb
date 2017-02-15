require_relative('../sql_runner.rb')
require_relative('./albums.rb')

class Artist

  attr_reader :artist_id
  attr_accessor :name

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

  def self.all()

    sql = "SELECT * FROM artists;"
    results = SqlRunner.run(sql)
    result_objects = results.map {|result| Artist.new(result)}
    return result_objects
  end

  def albums()
    sql = "SELECT * FROM albums WHERE artist_id = #{@artist_id};"
    results = SqlRunner.run(sql)
    result_objects = results.map {|result| Album.new(result)}
    return result_objects
  end

  def delete()
    sql = "DELETE FROM albums WHERE artist_id = #{@artist_id}; 
          DELETE FROM artists WHERE artist_id = #{@artist_id};" # have to delete from both otherwise foreign key prob
    SqlRunner.run(sql)
  end

  def update()
    sql = "UPDATE artists
           SET (name) =
           ('#{@name}');"

    SqlRunner.run(sql)

  end


end