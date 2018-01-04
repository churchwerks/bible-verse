require 'rubygems'
require 'nokogiri'
require 'pry'
require 'open-uri'

html = open("https://www.biblestudytools.com/topical-verses/")

doc = Nokogiri::HTML(html)
verses = doc.css(".list-group-item").first.css(".xl-h3.list-group-item-heading").text
binding.pry
puts verses
