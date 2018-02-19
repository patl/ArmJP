When(/^user press on the l1$/) do
  @l1.click
end

Then(/^user verify that l1 page included l1 title$/) do
  (@browser.element(:class, 'clp_slots_holder').text.include? @l1_name).should == true
end

Then(/^press on l2$/) do
  @l2_name = @browser.element(:class, "level_2" ).text
  @browser.element(:class, "level_2" ).click
  end

Then(/^user verify that l2 page is included l2 title$/) do
  @browser.element(:class, 'main').text.include? @l2_name.should == true
end

When(/^user click on sort by and selects price low to height$/) do
  @browser.element(:class, 'top_searchresult_box').element(:class, 'sort_by_list').click
  @browser.element(:class, 'top_searchresult_box').element(:text, 'Price (High To Low)').click
 end

Then(/^user verify that products on the page are sorted correctly$/) do
  sleep(5)
  oldprice = @browser.element(:class, 'search_result_items').elements(:class, 'product_price').map do |element|
    element.text
  end
  oldprice = oldprice.delete_if{|price| price.length > 7}
  oldprice = oldprice.map { |word| word.gsub('$', '')}.map!(&:to_i)
  (oldprice == oldprice.sort! {|x, y| y <=> x}).should == true
end

When(/^user click on QV button$/) do
  sleep (5)
  #@browser.execute_script('javascript:window.scrollBy(0,500)')
  @browser.element(:class, 'quickviewbutton').wait_until_present.click
end