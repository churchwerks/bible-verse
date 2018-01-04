require 'rubygems'
require 'mechanize'
require 'logger'
require 'nokogiri'

agent = Mechanize.new
page = agent.get('http://www.biblestudytools.com/topical-verses/')
page = agent.page.link_with(:text => /Faith Bible Verses/).click
page.links.each do |link|
  puts link.text
end
