require_relative "../lib/team.rb"
require_relative "../lib/competition.rb"
require_relative "support/matchers/team_support.rb"
require_relative "spec_helper.rb"

describe Competition do
  let(:competition) { Competition.new }
  let(:team) { Team.new("Random name") }

  context "having no questions" do
    before { competition.stub(:questions => []) }

    it "doesn't accept any teams" do
      # competition.should_not allow_teams_to_enter
      expect(competition).not_to allow_teams_to_enter
      expect do
        team.enter_competition(competition)
      end.to raise_error Competition::Closed
    end
  end

  context "having questions" do
    # before { competition.questions = [ { :title => "Question" } ] }
    before { competition.stub(:questions => [ "Question" ]) }
    subject { competition }
    # expect(competition).to allow_teams_to_enter
    # competition.should allow_teams_to_enter 
    it { should allow_teams_to_enter }
    # expect{allow_teams_to_enter}.to be_true
  end

  context "when started" do
    it "is closed" do
      competition.should_receive(:close)
      competition.start
    end
  end
end









