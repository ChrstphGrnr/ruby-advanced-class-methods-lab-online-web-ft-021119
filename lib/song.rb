require 'pry'

class Song
  attr_accessor :name, :artist_name

  @@all = []

  def self.all
    @@all
  end

  def save
    #binding.pry
    self.class.all << self
    binding.pry
  end

  def self.create
    song = self.new
    self.all << song
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
    self.all << song
    song
  end

  def self.find_by_name(song_name)
  #  binding.pry
  match = false
    Song.all.each do |song|
      #binding.pry
      song.name == song_name ? match = song : nil
    end
    match
  end


  def self.find_or_create_by_name(name)
    # binding.pry
    Song.find_by_name(name) || Song.create_by_name(name)
#    song = self.find_by_name(name)
#    if song == nil
#      self.create_by_name(name)
#    else
#      self.find_by_name(name)
#    end
  end

  def self.alphabetical
    #binding.pry
    self.all.sort_by {|song| song.name}

  end

  def self.new_from_filename(filename)

    artist_name = filename.split(/\ -/)[0]
    name = filename.split(/\- |(.mp3)/)[1]

    song = Song.new_by_name(name)
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    artist_name = filename.split(/\ -/)[0]
    name = filename.split(/\- |(.mp3)/)[1]

    song = Song.create_by_name(name)
    song.artist_name = artist_name
    song
  end

  def self.destroy_all
    Song.all.clear
  end


end
