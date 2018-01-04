class BibleVerse::Topic
attr_accessor :title, :description, :url
@@all = []

  def initialize(title=nil, description=nil, url=nil)
    @title = title
    @description = description
    @url = url
  end

  def self.all
    @@all
  end

  def self.reset_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.find(id)
    self.all[id-1]
  end
end
