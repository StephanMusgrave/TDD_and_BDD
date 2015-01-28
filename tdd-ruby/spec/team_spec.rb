require_relative "../lib/team.rb"

describe Team do
  it "has a name" do
    # Team.new.should respond_to :name
    expect(Team.new("Random name")).to respond_to :name
  end

  it "has a list of players" do
    expect(Team.new("Random name").players).to be_kind_of Array

  end
  
  it "is favoured if it has celebrity in it" do
    expect(Team.new("Random name", [ "George Clooney", "Steve Musgrave" ])).to be_favoured
  end 

  it "complains if there is a bad word in the name" do
    expect { Team.new("Crappy name") }.to raise_error
  end
  
  context "given a bad list of players" do
    let(:bad_players) { {} }

    it "fails to create a bad player list" do
      expect { Team.new("Random name", bad_players) }.to raise_error
    end
  end
end





