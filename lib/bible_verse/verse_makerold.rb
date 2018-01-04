class BibleVerse::Vmaker
  
  def self.make_verses(url)
    doc = Nokogiri::HTML(open("#{url}"))
    verses = doc.css(".list-group-item.bst-list-group-item-dark.no-top")
    verses.each do |v|
      title = v.css(".list-group-item-heading").text
      if title != ""
        description = v.css(".scripture").text.strip
        url = v.css("a").attribute("href").value
        verse = BibleVerse::Verse.new(title,description,url)
        verse.save
      end
    end
  end
end
