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

  combined_output.chomp.should == slip
end

