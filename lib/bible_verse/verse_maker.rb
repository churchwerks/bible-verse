class BibleVerse::Vmaker
  def get_page(url)
    Nokogiri::HTML(open("#{url}"))
  end

  def get_verses(url)
    self.get_page.css(".list-group-item.bst-list-group-item-dark.no-top")
  end

  def make_verses(url)
    get_verses.each do |v|
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
