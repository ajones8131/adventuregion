Given(/^the following places exist:$/) do |places_table|
  places_table.hashes.each do |place|
    Place.create(place)
  end
end

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  regexp = /#{e1}.*#{e2}/m
  expect(page.body).to match(regexp)
end

When /I (un)?select (.*)/ do |uncheck, type_list|
  type_list.split(/,\s*/).each { |type|
    if uncheck
      incheck "types_#{type}"
    else
      check "types_#{type}"
    end
  }
end
