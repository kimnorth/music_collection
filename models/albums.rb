require_relative('../sql_runner.rb')

class Album

  attr_reader :artist_id

  def initialize(options)
    @title = options["title"]
    @genre = options["genre"]
    @artist_id = options["artist_id"] if options["artist_id"]
  end

  def save()

    sql = "INSERT INTO albums 
    (title, genre, artist_id)
    VALUES
    ('#{@title}', '#{@genre}', #{@artist_id}) RETURNING album_id;"

    results = SqlRunner.run(sql)
    @album_id = results.first['album_id'].to_i

  end

  def self.all()
    sql = "SELECT * FROM albums;"
    results = SqlRunner.run(sql)
    result_objects = results.map {|result| Album.new(result)}
    return result_objects
  end

  def show_album_artist
    sql = "SELECT * FROM artists WHERE artist_id = #{@artist_id};"
    results = SqlRunner.run(sql)
    result_objects = results.map {|result| Artist.new(result)}
    return result_objects
  end

  def delete()
    sql = "DELETE FROM albums WHERE artist_id = #{@artist_id};" # have to delete from both otherwise foreign key prob
    SqlRunner.run(sql)
  end

end