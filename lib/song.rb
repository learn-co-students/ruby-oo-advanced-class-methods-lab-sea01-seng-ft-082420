require "pry"
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  #instantiates and saves the song, and it returns the new song that was created
  def self.create
    song = Song.new
    song.save
    song
  end

  #instantiates a song with a name property
  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  #instantiates and saves a song with a name property
  def self.create_by_name(name)
    song = Song.new
    song.name = name
    song.save
    song
  end

  #find a song present in @@all by name  
  def self.find_by_name(name)
    Song.all.find do |song|
      song.name == name
    end
  end
  
  #invokes .find_by_name and .create_by_name instead of repeating code
  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  #returns all the song instances in alphabetical order by song name
  def self.alphabetical
    self.all.sort_by do |songs|
      songs.name
    end
  end

  #initializes a song and artist_name based on the filename format
  def self.new_from_filename(filename)
    file_array = filename.split(" - ")
    file_array[1] = file_array[1].chomp('.mp3')
    song = Song.new
    song.name = file_array[1]
    song.artist_name = file_array[0]
    song
  end

  #initializes and saves a song and artist_name based on the filename format
  def self.create_from_filename(filename)
    file_array = filename.split(" - ")
    file_array[1] = file_array[1].chomp('.mp3')
    song = Song.new
    song.name = file_array[1]
    song.artist_name = file_array[0]
    song.save
    song
  end

  #clears all the song instances from the @@all array
  def self.destroy_all
    self.all.clear
  end

end
