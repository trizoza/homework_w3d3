require ('pg')
require_relative ('sql_runner')

class Album

  attr_accessor :title, :genre, :id
  attr_accessor :artist_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @genre = options['genre']
    @artist_id = options['artist_id'].to_i
  end

  def add()
    sql = "
      INSERT INTO albums 
      (title, genre, artist_id)
      VALUES
      ('#{@title}', '#{@genre}', #{@artist_id})
      RETURNING *;
      "
    @id = SqlRunner.run( sql )[0]['id'].to_i
  end

  def self.list_all() 
    sql = "
      SELECT * FROM albums;
    "
    albums = SqlRunner.run( sql )
    return albums.map { |album| Album.new( album ) }
  end

  def self.find_album(id)
    sql = "
      SELECT * FROM albums WHERE id = #{id};
    "
    albums = SqlRunner.run( sql )
    return albums.map { |album| Album.new( album ) }
  end

  def show_artist_name()
    sql = "
      SELECT * FROM artists WHERE id = #{@artist_id};
    "
    name = SqlRunner.run( sql )
    return name[0]
  end

  def self.delete_all()
    sql = "
      DELETE FROM albums;
    "
    SqlRunner.run( sql )
  end

  def update()
    sql = "
      UPDATE albums 
      SET (title, genre) = ('#{@title}', '#{@genre}')
      WHERE id = #{@id};
    "
    SqlRunner.run( sql )
  end

  def delete()
    sql = "
      DELETE FROM albums 
      WHERE id = #{@id};
    "
    SqlRunner.run( sql )
  end

end