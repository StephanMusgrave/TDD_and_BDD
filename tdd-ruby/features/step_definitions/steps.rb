require 'cucumber/rspec/doubles'
require_relative "../../lib/team.rb"
require_relative "../../lib/competition.rb"

Given /there is a team called "([^"]*)"/ do |name|
  @team = Team.new name
end

Given /I have a competition with( no)? questions/ do |no_questions|
  @competition = Competition.new
  if no_questions
    @competition.stub questions: [] 
  else
    @competition.stub questions: [ "Question" ] 
  end
end

When /a team enters the competition/ do
  @method = -> { @team.enter_competition @competition }
  # Proc objects are blocks of code that have been bound to a
  # set of local variables. Once bound, the code may be callled
  # in different contexts and still access those variables.
end

Then /I should( not)? see an error/ do |dont_raise|
  if dont_raise
    @method.should_not raise_error
  else
    @method.should raise_error Competition::Closed
    # expect(@method).to raise_error Competition::Closed
  end
end
