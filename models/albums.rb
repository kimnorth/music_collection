require_relative('../sql_runner.rb')

class Album

  def initialize(options)
    @title = options["title"]
    @genre = options["genre"]
    @artist_id = options["artist_id"] if options["artist_id"]
  end

  def save()

    sql = "INSERT INTO albums 
    (title, genre)
    VALUES
    ('#{@title}', '#{@genre}') RETURNING album_id;"

    results = SqlRunner.run(sql)
    @album_id = results.first['album_id'].to_i

  end

end