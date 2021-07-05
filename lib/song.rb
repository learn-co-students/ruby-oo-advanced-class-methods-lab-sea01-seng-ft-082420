require 'pry'
class Song

  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name (name)
    @@all.find {|element| element.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    new_array = filename.chomp(".mp3").split(" - ")
    song = self.new
    song.name = new_array[1]
    song.artist_name = new_array[0]
    song
  end

  def self.create_from_filename(filename)
    new_array = filename.chomp(".mp3").split(" - ")
    song = self.new
    song.name = new_array[1]
    song.artist_name = new_array[0]
    song.save
    song
  end

  def Song.destroy_all
    self.all.clear
  end
end

# binding.pry
# 0