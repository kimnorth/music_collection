require('pry')
require_relative('./models/artists.rb')
require_relative('./models/albums.rb')

artist1 = Artist.new({"name" => "Bryan Adams"})
artist1.save()

album1 = Album.new({"title" => "Greatest Hits", "genre" => "Classic Rock", "artist_id" => artist1.artist_id })
album1.save()