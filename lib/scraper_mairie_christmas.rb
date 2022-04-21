require 'nokogiri'
require 'open-uri'

# https://www.webscrapingapi.com/ruby-web-scraping/
# https://rmhsolutions.com/softwarestestingtrends/understanding-xpath-to-write-better-xpath-locators/
# definition of methode
def get_townhall_email(town_name)

  puts "downloading page"
  # string html page
  html_page = URI.open("http://annuaire-des-mairies.com/95/#{town_name}.html")
  puts "page downloaded"

  #transforms the string in a NOKOGIRI super magic document
  #page is NOKOGIRIs object
  page = Nokogiri::HTML(html_page)
  puts "NOKOGIRI object"

  # https://stackoverflow.com/questions/19815538/css-xpath-sibling-selector-in-nokogiri
  email = page.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text
  puts email

  return nil if email.empty?
  return email
end

def get_townhall_names()

  puts "downloading page"
  # string html page
  html_page = URI.open("http://annuaire-des-mairies.com/val-d-oise.html")
  puts "page downloaded"

  #transforms the string in a NOKOGIRI super magic document
  #page is NOKOGIRIs object
  page = Nokogiri::HTML(html_page)
  puts "NOKOGIRI object"

  return page.xpath('//a[@class="lientxt"]').map do |link|
    link.text.downcase.gsub(" ", "-")
  end


end
