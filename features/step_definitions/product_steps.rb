Given /^I order (\d+) "([^"]*)" items$/ do |qty, item|
  run "ruby ../../runner.rb \"Widget X 2000\" 2"
end

Then /^I should see a packing slip with a total of \$(\d+)$/ do |total|
  combined_output.should == <<-EOS
Qty             Item            Price Each        Total
2               Widget X 2000   $250.00           $#{total}.00
  EOS
end

