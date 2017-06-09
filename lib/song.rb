require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
    self
  end

  def self.create
    song = self.new
    self.all << song
    song
  end

  def initialize(name="Untitled Song", artist_name="Unknown Artist")
    @name = name
    @artist_name = artist_name
  end

  def self.new_by_name(name)
    song = self.new(name)
    song
  end

  def self.create_by_name(name)
    song = self.new(name)
    song.save
  end

  def self.find_by_name(song_name)
    self.all.detect { |song| song.name == song_name }
  end

  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name) == nil
      self.create_by_name(song_name)
    else
      self.find_by_name(song_name)
    end
  end

  def self.alphabetical
    self.all.sort_by { |song| song.name }
  end

  def self.create_from_filename(filename)
    song_data = filename.chomp(".mp3").split(" - ")
    # song_data[0] is artist, [1] is title
    # binding.pry
    song = self.new(song_data[1],song_data[0])
    song.save
  end

  def self.new_from_filename(filename)
    song_data = filename.chomp(".mp3").split(" - ")
    # song_data[0] is artist, [1] is title
    song = self.new(song_data[1],song_data[0])
  end

  def self.destroy_all
    self.all.clear
  end


end # of Song class
