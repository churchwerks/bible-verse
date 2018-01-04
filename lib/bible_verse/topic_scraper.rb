class BibleVerse::Tscraper
  def get_page
    Nokogiri::HTML(open("https://www.biblestudytools.com/topical-verses/"))
  end

  def get_topics
    self.get_page.css(".list-group-item")
  end

  def make_topics
    get_topics.each do |t|
      title = t.css(".xl-h3.list-group-item-heading").text
      if title != ""
        description = t.css("p").text
        url = t.css("a").attribute("href").value
        topic = BibleVerse::Topic.new(title,description,url)
        topic.save
      end
    end
  end
end
