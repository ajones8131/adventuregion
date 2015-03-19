Then /^I see directions on map$/ do
	 page.has_content? 'UCCS'
	 page.has_content? 'Pikes Peak'
end
