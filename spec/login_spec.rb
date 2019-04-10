require_relative ("../lib/bot_login")

describe "---twitter_login function" do
  it "return a valid client" do
    expect( twitter_login ).to_not be_nil
  end
end
