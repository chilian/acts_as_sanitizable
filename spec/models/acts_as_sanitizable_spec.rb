require 'spec_helper'


describe ActsAsSanitizable do


  it "first_name ' Christoph ' returns 'Christoph' after strip" do
    user = create(:user, first_name: " Christoph ")   
    expect(user.first_name).to eq("Christoph")
  end

  it "last_name 'Chilian' returns 'CHILIAN' after upcase" do
    user = create(:user, last_name: "Chilian")   
    expect(user.last_name).to eq("CHILIAN")
  end

  it "email 'chriStoph@Chilian.de  ' returns 'christoph@chilian.de' after squish and downcase" do
    user = create(:user, email: "chriStoph@Chilian.de  ")   
    expect(user.email).to eq("christoph@chilian.de")
  end

  it "username should be downcased gsub'ed" do
    user = create(:user, username: '@YamYam')
    expect(user.username).to eq 'yamyam'
  end

end