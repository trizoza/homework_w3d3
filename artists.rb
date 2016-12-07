require ('pg')
require_relative ('sql_runner')

class Artist

  attr_reader :id, :name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def add()
    sql ="
      INSERT INTO artists
      (name)
      VALUES
      ('#{@name}')
      RETURNING *;
    "
    @id = SqlRunner.run( sql )[0]['id'].to_i
  end

  def self.list_all()
    sql = "
      SELECT * FROM artists;
    "
    artists = SqlRunner.run( sql )
    return artists.map { |artist| Artist.new( artist ) }
  end

  def show_albums()
    sql = "
      SELECT * FROM albums WHERE artist_id = #{@id};
    "
    albums = SqlRunner.run( sql )
    return albums.map { |album| Album.new(album) }
  end

  def self.delete_all()
    sql = "
      DELETE FROM artists;
    "
    SqlRunner.run( sql)
  end

  # def show_albums()
  #   sql = "
  #     SELECT * FROM artists WHERE id = #{id};
  #   "
  #   artists = SqlRunner.run( sql )
  #   return artists.map { |artist| Artist.new( artist ) }
  # end

end