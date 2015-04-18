Given(/^the following places exist:$/) do |places_table|
  places_table.hashes.each do |place|
    Place.create(place)
  end
end

When(/^I follow "(.*?)"$/) do |arg1|
  true
end

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  regexp = /#{e1}.*#{e2}/m
  expect(page.body).to match(regexp)
end

When /I (un)?check (.*)/ do |uncheck, type_list|
  type_list.split(/,\s*/).each { |type|
    if uncheck
      incheck "types_#{type}"
    else
      check "types_#{type}"
    end
  }
end

When /I select (.*) from (.*)/ do |value, list|
  page.select(value, :from => list)
end

Then(/^I fill out "(.*?)" with "(.*?)"$/) do |field, value|
  fill_in(field, :with => value)
end
