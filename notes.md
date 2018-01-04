# CLI Data Gem Project
For my project, I am going to scrape the [Bible Study Tools](http://www.biblestudytools.com/) website. My CLI program will present the user with a menu of Featured Bible verses from which to choose from in order to read the Bible verse and go to the url for that particular Bible verse.

## Project Structure
The CLI program code will be structured, in the following manner:
```ruby
BIBLEVERSE Object
  CLI Object
    SCRAPPER Object
      TOPICS Object
        VERSE Object
```
## Project Flow
Entry to and exit from the program will be handled from the CLI CLASS:
```ruby
class BibleVerse::CLI
  def call
    puts "Topical Bible Verses"
    list_topics
    menu
  end
```
The user is presented with a list of Bible Verse Topics and a menu of actions to take. When the user chooses a topic; a list of Bible verses which correspond to the chosen topic, will be displayed. When the user selects a particular verse, a webpage for that Bible verse will be opened in their web browser.

## Bible-Verse CLI program
The complete Bible-Verse CLI program can be found at my [GitHub Repository](https://github.com/churchwerks/bible-verse).

I will build the complete program over the next five days and give a daily recap of my coding journey along the way.

Until then, Peace be with you.
