Given /^I order (\d+) "([^"]*)" items$/ do |qty, item|
  @items ||= []
  @items << [qty, item]
end

Then /^I should see a packing slip:/ do |slip|

  input =
    @items.map do |pair|
      '%s;%s' % pair
    end.join("\n")

  create_file("input.txt", input)

  run "ruby ../../runner.rb"

  regexp = Regexp.escape(slip)
  combined_output.chomp.should match(/#{regexp}/m)
end

Given /^I order a copy of "([^"]*)"$/ do |book|
  @items ||= []
  @items << [1, book]
end


Then /^the packing slip should be sent to the royalty department$/ do
  combined_output.should =~ /A copy of the packing slip was sent to the royalty department/
end

Given /^I purchase a membership$/ do
  @items ||= []
  @items << [1, "Membership"]
end

Then /^my membership should be activated$/ do
  combined_output.should =~ /Your membership has been activated/
end

