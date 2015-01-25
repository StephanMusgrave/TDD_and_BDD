RSpec::Matchers.define :allow_teams_to_enter do |expected|
  match do |actual|
    begin
      Team.new("Random name").enter_competition actual
      true
    rescue
      false
    end
  end

  failure_message do |actual|
    "expected that #{actual} would allow team to enter"
  end

  failure_message_when_negated do |actual|
    "expected that #{actual} would not allow team to enter"
  end

  description do
    "should allow teams to enter"
  end
end

# template from https://github.com/dchelimsky/rspec/wiki/Custom-Matchers
# fixed deprecated 'should_not' > 'when_negated' and 'should' > ''