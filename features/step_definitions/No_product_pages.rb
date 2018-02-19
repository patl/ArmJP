Then(/^user press on store locator icon from header$/) do
  @browser.element(:class, 'storelocator_navigation_item').click
end

When(/^user checked the search filed (.*)$/) do |county|
  @browser.text_field(:id, 'store_search_query').set(county)
  @browser.element(:id, 'store_search_submit').click
end

Then(/^user checked the stores list$/) do
  (@browser.element(:class, 'store_list_item').wait_until_present.present?).should ==true
end

And(/^user checked the map$/) do
  (@browser.element(:id, 'google_map').present?).should ==true
end

When(/^user press on search icon from heder$/) do
  @browser.element(:class, 'show_searchbar_button').click
end


When(/^user see search  suggestion list$/) do
  @browser.element(:class, 'suggestions').wait_until_present
  @suggtext = @browser.element(:class, 'suggestions').text
  (@browser.element(:class, 'suggestions').text.include? @searchtext.upcase).should == true
end

And(/^press on search button for search$/) do
  @browser.element(:class, 'search_button').click
end

When(/^user see the search result page$/) do
  @browser.element(:class, 'search_result_page_hits').wait_until_present
  (@browser.element(:class, 'search_result_page_hits').text.include? @searchtext).should == true
end


Then(/^user entered searchable word (.*)$/) do |serchword|
  @searchtext = serchword
  @browser.text_field(:class, 'search_input').set(serchword)
end

