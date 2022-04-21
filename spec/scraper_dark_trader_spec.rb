require_relative '../lib/scraper_dark_trader.rb'

describe "the scrap_coinmarketcap method" do
  it "should return the first 20 ranking cryptocurrencies symbols" do
    cryptocurrencies = scrap_coinmarketcap.map { |hash| hash.keys.first}
    expect(cryptocurrencies).to include("BTC")
  end
end
