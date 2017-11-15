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

  def self.create
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(song_name)
    song = Song.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = Song.new
    song.name = "#{song_name}"
    @@all << song
    song
  end

  def self.find_by_name(song_name)
    all.detect {|s| s.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    Song.find_by_name(song_name) || Song.create_by_name(song_name)
  end

  def self.alphabetical
    Song.all.sort_by {|s| s.name}
  end

  def self.new_from_filename(filename)
    data = filename.split(" - ")
    artist_name = data[0]
    name = data[1].chomp(".mp3")

    song = Song.new
    song.artist_name = artist_name
    song.name = name
    song
  end

  def self.create_from_filename(filename)
    all << Song.new_from_filename(filename)
  end

  def self.destroy_all
    all.clear
  end

end
