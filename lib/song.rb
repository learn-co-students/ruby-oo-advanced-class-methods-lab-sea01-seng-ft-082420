require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
#binding.pry
  def self.create
    Song.new.save[0]
  end

  def self.new_by_name(nname)
    nsong=Song.new
    nsong.name= nname
    nsong.save
    nsong
  end

  def self.create_by_name(nname)
    nsong=Song.new
    nsong.name= nname
    nsong.save
    nsong
  end

  def self.find_by_name(nname)
    Song.all.find{|name| name.name == nname}
  end

  def self.find_or_create_by_name(nname)
    if Song.find_by_name(nname) == nil
      Song.create_by_name(nname)
    else 
      Song.find_by_name(nname)
    end
  end

  def self.alphabetical
    Song.all.sort_by {|k| k.name}
  end

  def self.new_from_filename(filename)
    nfile=filename.split
    nsong=Song.new
    nsong.artist_name=nfile[0]
    ffile=filename.split("")
    ffile.each_with_index do |key, index|
      if key == "-"
        ffile.shift(index+2)
      end
      if key == "."
        ffile.slice!(index..-1)
      end
    end
    nsong.name = ffile.join
    nsong
  end

  def self.create_from_filename(filename)
    nfile=filename.split
    nsong=Song.new
    nsong.artist_name=nfile[0]
    ffile=filename.split("")
    ffile.each_with_index do |key, index|
      if key == "-"
        ffile.shift(index+2)
      end
      if key == "."
        ffile.slice!(index..-1)
      end
    end
    nsong.name = ffile.join
    nsong.save
    nsong
  end

  def self.destroy_all
    @@all = []
  end

end

# binding.pry
# 0


# Song Class Methods
#   .create
#     instantiates and saves the song, and it returns the new song that was created (FAILED - 1)
#   .new_by_name
#     instantiates a song with a name property (FAILED - 2)
#   .create_by_name
#     instantiates and saves a song with a name property (FAILED - 3)
#   .find_by_name
#     can find a song present in @@all by name (FAILED - 4)
#     returns falsey when a song name is not present in @@all (FAILED - 5)
#   .find_or_create_by_name
#     invokes .find_by_name and .create_by_name instead of repeating code (FAILED - 6)
#     returns the existing Song object (doesn't create a new one) when provided the title of an existing Song (FAILED - 7)
#     creates a new Song object with the provided title if one doesn't already exist (FAILED - 8)
#   .alphabetical
#     returns all the song instances in alphabetical order by song name (FAILED - 9)
#   .new_from_filename
#     initializes a song and artist_name based on the filename format (FAILED - 10)
#   .create_from_filename
#     initializes and saves a song and artist_name based on the filename format (FAILED - 11)
#   .destroy_all
#     clears all the song instances from the @@all array (FAILED - 12)