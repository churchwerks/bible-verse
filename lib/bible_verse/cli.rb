class BibleVerse::CLI
  def call
    BibleVerse::Tscraper.new.make_topics
    puts ""
    puts "Welcome to Bible Verses by Topic "
    puts ""
    start
  end

  def start
    BibleVerse::Topic.all.each.with_index do |post, index|
      puts ""
      puts "#{index+1}. #{post.title}"
      puts ""
    end
    puts "What Featured Topic would you like to see? Enter a number, or enter zero 0 to quit."
    input = gets.to_i
    input == "0" ? goodbye : display_topic(input)
  end

  def display_topic(input)
    topic = BibleVerse::Topic.find(input)
    puts ""
    puts "#{topic.title}"
    puts ""
    puts "#{topic.description}"
    puts ""
    puts "#{topic.url}"
    puts ""
    url = topic.url
    puts "Would you like to see see the Verses for this Topic or another Topic? Enter V or T"
    choice = gets.strip.downcase
    choice == "v" ? display_verses(url,input) : start
  end

  def display_verses(url,input)
    BibleVerse::Vmaker.make_verses(url)
    BibleVerse::Verse.all.each.with_index { |verse, index| puts "#{index+1}. #{verse.title}"}
    if BibleVerse::Verse.all.empty?
      puts "There are no verses to display, Hit Enter to continue, or Q to quit."
      choice = gets.strip.downcase
      choice == "q" ? goodbye : start
    else
      puts "What Verse would you like to see? Enter a number, or enter zero 0 to quit."
      number = gets.to_i
      if number != 0
        verse = BibleVerse::Verse.find(number)
        if verse == nil
          BibleVerse::Verse.reset_all
          display_verses(url,input)
        else
          puts "Verse: #{verse.title}"
          puts "   #{verse.description}"
          puts ""
          puts "Would you like to see another Verse V or Topic T or Quit Q?"
          BibleVerse::Verse.reset_all
          choice = gets.strip.downcase
          if choice == "t"
            start
          elsif choice == "v"
            display_verses(url,input)
          else
            goodbye
          end
        end
      else
        goodbye
      end
    end
  end

  def goodbye
    puts ""
    puts ""
    puts "Peace Be with You!"
    puts ""
    puts ""
  end
end
