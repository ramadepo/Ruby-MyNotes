require 'nokogiri'
require 'open-uri'

puts

web_adr = "http://search.books.com.tw/search/query/cat/all/key/狼與辛香料/sort/1/page/1/v/0/"
pre_web = URI::escape(web_adr)
web = Nokogiri::HTML(open(pre_web))

a = web.css('ul.searchbook li.item').first.css('h3 a').attribute("href")
p a

puts