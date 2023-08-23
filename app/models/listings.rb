# require 'nokogiri'
# require 'open-uri'

# class Listings < ApplicationRecord

#     doc = Nokogiri::HTML(open("https://www.myjobmag.co.ke/"))
#     doc.xpath('//li[@class = 'mag-b']/h2').each do |node|
#         puts node.text
#     end
# end