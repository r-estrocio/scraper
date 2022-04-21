require_relative '../lib/scraper_mairie_christmas.rb'

describe "the get_townhall_email method" do
  it "should return the email for Ableiges" do
    expect(get_townhall_email("ableiges")).to eq("mairie.ableiges95@wanadoo.fr")
  end

  it "should return nil for Chatenay-en-France" do
    expect(get_townhall_email("chatenay-en-france")).to eq(nil)
  end
end

describe "the get_town_names method" do
  it "should return the town names" do
    expect(get_town_names).to include("ableiges")
    expect(get_town_names).to include("chatenay-en-france")
  end
end

describe "the get_townhall_emails method" do
  it "should return the townhalls emails" do
    expect(get_townhall_emails["guiry-en-vexin"]).to eq("mairie.guiry-en-vexin@wanadoo.fr")
    expect(get_townhall_emails["chatenay-en-france"]).to eq(nil)
  end
end
