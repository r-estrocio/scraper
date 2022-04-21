require_relative '../lib/scraper_mairie_christmas.rb'

describe "the get_townhall_email method" do
  it "should return the email for Ableiges" do
    expect(get_townhall_email("ableiges")).to eq("mairie.ableiges95@wanadoo.fr")
  end

  it "should return nil for Chatenay-en-France" do
    expect(get_townhall_email("chatenay-en-france")).to eq(nil)
  end
end

describe "the get_townhall_urls method" do
  it "should return the townhalls urls" do
    expect(get_townhall_names).to include("ableiges")
    expect(get_townhall_names).to include("chatenay-en-france")
  end
end
