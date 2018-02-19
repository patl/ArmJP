Then(/^user should see the QV pop\-up$/) do
  @browser.element(:id, 'QuickViewDialog').wait_until_present.present?.should == true
end

Then(/^verify that product image is present$/) do
  @browser.element(:id, 'QuickViewDialog').element(:class, 'product_image').present?.should == true
end

And(/^verify that Product name is present$/) do
  @addedproduct = @browser.element(:id, 'QuickViewDialog').element(:class, 'product_name').text
  @browser.element(:id, 'QuickViewDialog').element(:class, 'product_name').present?.should == true
end

And(/^verify that Product description is present$/) do
  @browser.element(:id, 'QuickViewDialog').element(:class, 'description').present?.should == true
end

And(/^verify that Quantity is displayed$/) do
  @browser.element(:id, 'QuickViewDialog').element(:id, 'quantity').present?.should == true
end

And(/^verify that product price is displayed$/) do
  @browser.element(:id, 'QuickViewDialog').element(:class, 'price_box').present?.should == true
end

And(/^Verify that add to bag button is displayed$/) do
  @browser.element(:id, 'QuickViewDialog').element(:class, 'add_to_cart').present?.should == true
end

And(/^Verify that Wish List icon is present$/) do
  @browser.element(:class, 'wishlist_button').present?.should == true
  @browser.element(:class, 'wishlist_button').click
  end

When(/^register pop\-up is displayed$/) do
  @browser.element(:class, 'ui_register_dialog').wait_until_present.present?.should == true
end

When(/^user click on PDP button$/) do
  @browser.element(:class, 'search_result_content').element(:class, 'product_name').click
end

Then(/^verify that product image is present on PDP$/) do
  @browser.element(:id, 'pdp_section_topcontent').element(:class, 'product_image').present?.should == true
end

And(/^verify that Product name is present on PDP$/) do
  @addedproduct = @browser.element(:id, 'pdp_section_topcontent').element(:class, 'product_name').text
  @browser.element(:id, 'pdp_section_topcontent').element(:class, 'product_name').present?.should == true
end

And(/^verify that Product description is present on PDP$/) do
  @browser.element(:id, 'pdp_section_topcontent').element(:class, 'product_description_box').present?.should == true
end

And(/^verify that Quantity is displayed on PDP$/) do
  @browser.element(:id, 'pdp_section_topcontent').element(:id, 'quantity').present?.should == true
end

And(/^verify that product price is displayed on PDP$/) do
  @browser.element(:id, 'pdp_section_topcontent').element(:class, 'price_box').present?.should == true
end

And(/^Verify that add to bag button is displayed on PDP$/) do
  @browser.element(:id, 'pdp_section_topcontent').element(:class, 'add_to_cart').present?.should == true
end


Then(/^user fills email with (.*) from add to wish pop\-up$/) do |email|
  @browser.iframe(:class, 'login_iframe').text_field(:xpath, 'html/body/div[3]/div[2]/form/fieldset/div[2]/div/input').set email
end

Then(/^user fills password with (.*) from add to wish pop\-up$/) do |password|
  @browser.iframe(:class, 'login_iframe').text_field(:id, 'dwfrm_login_password').set password
end


When(/^user press on log in button from with pop\-up$/) do
  @browser.iframe(:class, 'login_iframe').element(:name, 'dwfrm_login_login').click
end

Then(/^user should see save result pop\-up$/) do
  @browser.element(:class, 'save-result-dialog').wait_until_present.present?.should == true
end

When(/^user click on go to wish list button from save result pop\-up$/) do
  @browser.element(:class, 'save-result-dialog').element(:xpath, ".//*[@id='SaveResultDialog']/div/a").click
end

Then(/^user should be redirected to my account \-> wish list page$/) do
  @browser.element(:class, 'wishlist_page').wait_until_present.present?.should == true
end

And(/^verify that added product is displayed in the list$/) do
  (@browser.element(:class, 'wishlist_products').text.include? @addedproduct).should == true
end

Then(/^user press on delete link$/) do
  @browser.element(:name, 'dwfrm_wishlist_items_i0_deleteItem').click
end

And(/^user shouldn't see added product in wish list$/) do
  (@browser.element(:class, 'wishlist_products').text.include? @addedproduct).should == false

end