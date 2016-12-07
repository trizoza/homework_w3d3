require ('pry')
require_relative ('albums')
require_relative ('artists')

artist1 = Artist.new({ "name" => "Dr.Dre" })
artist1.add()

album1 = Album.new({ "title" => "2001", "genre" => "rap", "artist_id" => artist1.id })
album1.add()

album2 = Album.new({ "title" => "The chronic", "genre" => "rap", "artist_id" => artist1.id })
album2.add()

binding.pry
nil