
#博克來查詢

http://search.books.com.tw/search/query/cat/all/key/:book_name/sort/:sort_method/page/:page_num/v/:reveal_way/
http://search.books.com.tw/search/query/cat/all/key/狼與辛香料/sort/1/page/1/v/0/  #狼與辛香料 準確度排序 第一頁 條列顯示

:sort_method  #  1.準確度  5.上市日期(新->舊)  6.上市日期(舊->新)  7.優惠價(高->低)  8.優惠價(低->高) 9.暢銷度  其他.準確度
:page_num     #  1.第一頁  ...  N.第Ｎ頁  >N.找不到  <1.第一頁
:reveal_way   #  0.條列式  1.圖片式  2.圖片式  其他.條列式

"ul.searchbook li.item"  #每一個項目
  "h3 a"  #超連結標題 content取得名字 attribute('href')取得連結
  "span.price strong b"  #價格 可能因為顯示打折而有兩個