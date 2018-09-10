require 'nokogiri'
require 'open-uri'
require 'csv'

puts

#將指定網址的整個html爬下來回傳
def get_web(name,page)
  web_adr = "http://search.books.com.tw/search/query/cat/all/key/" + name + "/sort/1/page/" + page.to_s + "/v/0/"
  pre_web = URI::escape(web_adr)
  Nokogiri::HTML(open(pre_web))
end

#使用者輸入關鍵字
puts "請輸入要在博客來尋找的東西 : "
search_name = gets.chomp

#初始化 第一頁 共0筆
search_page = 1
all_result = 0
#先行取得總共頁數
total_page = get_web(search_name,search_page).css('div.mod div.cntlisearch10 div.page span').first.content.to_i

CSV.open("result.csv","w+") do |csv|
  csv << ["\xEF\xBB\xBF名稱","價格","網址"]
  #開爬
  loop{
    begin
      web = get_web(search_name,search_page)
    rescue => e
      puts e.message
      break
    end
    
    #目標 : 條列式項目的 1.書名 2.連結網址 3.價格
    web.css('ul.searchbook li.item').each do |item|

      #書名 & 網址
      link = item.css('h3 a').first
      name = link.content.strip
      adr = link.attribute('href').to_s
      adr = adr[2,adr.length-2]
      #價格(有可能有打折)
      price = item.css('span.price strong b')
      price = price[1] ? price[1].content : price[0].content

      #寫入csv
      csv << [name,price,adr]

      all_result += 1
    end

    break if search_page == total_page
    search_page += 1
  }

  #程式結束
  csv << ["***","***","***"] << ["Page",search_page] << ["All",all_result] << ["***","***","***"]
  puts "Program End"
end