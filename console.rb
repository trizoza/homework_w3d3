require ('pry')
require_relative ('albums')
require_relative ('artists')

Album.delete_all()
Artist.delete_all()

artist1 = Artist.new({ "name" => "Dr.Dre" })
artist1.add()

album1 = Album.new({ "title" => "2001", "genre" => "rap", "artist_id" => artist1.id })
album1.add()

album2 = Album.new({ "title" => "The chronic", "genre" => "rap", "artist_id" => artist1.id })
album2.add()

album3 = Album.new({ "title" => "Detox", "genre" => "rap", "artist_id" => artist1.id })
album3.add()

artist2 = Artist.new({ "name" => "Eminem" })
artist2.add()

album4 = Album.new({ "title" => "Slim Shady LP", "genre" => "rap", "artist_id" => artist2.id })
album4.add()

album5 = Album.new({ "title" => "Marshall Mathers LP", "genre" => "rap", "artist_id" => artist2.id })
album5.add()

artist2.name = "blabla"

binding.pry
nil