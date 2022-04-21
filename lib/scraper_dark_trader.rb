require 'nokogiri'
require 'open-uri'

# definition of methode
def scrap_coinmarketcap()

  puts "downloading page"
  # string html page
  html_page = URI.open("https://coinmarketcap.com/all/views/all/")
  puts "page downloaded"
  #transforms the string in a NOKOGIRI super magic document
  #page is NOKOGIRIs object
  page = Nokogiri::HTML(html_page)
  puts "NOKOGIRI object"

  #method xpath in action
  #first inspect html
  #defining rows as all tr (line) with cmc-table-row class
  rows = page.xpath('//tr[@class="cmc-table-row"]')
  puts "xpath rows defined"

  #defining rows as all td (columns) in which symbol exists
  symbols = rows.xpath('//td[contains(@class, "symbol")]')
  puts "xpath symbol defined"

  #defining symbols_text
  #symbols_text is an array of the symbols of the cryptocurrencies
  symbols_text = symbols.map { |s| s.text }
  puts symbols_text.join(" ")

  #defining prices as all td (columns) in which price exists
  prices = rows.xpath('//td[contains(@class, "price")]')
  puts "xpath prices defined"

  #defining prices_float
  #prices_float is an array of the prices of the cryptocurrencies as floats
  prices_float = prices.map do |p|
    # subtracting $ and , symbols
    p.text.gsub("$", "").gsub(",", "").to_f
  end
  puts prices_float.join(" ")

  #defining symbol_prices_duo
  #symbol_price_duo its an array of hashes
  symbol_price_duo = symbols_text.each_with_index.map do |symbol, index|
    hash = Hash.new
    hash[symbol] = prices_float[index]

    #to return a value inside a block
    next hash
  end
  puts symbol_price_duo
  return symbol_price_duo
end
