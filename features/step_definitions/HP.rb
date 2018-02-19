Then(/^user verify that newsletter pop\-up is present$/) do
  (@browser.element(:id, "dialog-container").wait_until_present.present?).should == true
end

And(/^close the newsletter pop-up$/) do
  @browser.element(:class, "ui-dialog-titlebar-close").wait_until_present.click
end


And(/^verify that user can see header$/) do
  (@browser.element(:class, 'header').visible?).should == true
end

And(/^user can see stores$/) do
  (@browser.element(:class, 'storelocator_navigation_item').present?).should ==true
end

And(/^user can see logo$/) do
  (@browser.element(:class, 'logo').present?).should ==true
end

And(/^user can see 'Email sign up'$/) do
  (@browser.element(:class, 's_newsletter_subscribe_link').present?).should == true
end

And(/^user can see 'My account'$/) do
  (@browser.element(:class, 'account_navigation_login').present?).should == true
end

And(/^user can see 'Minicart'$/) do
  (@browser.element(:id, 'minicart').present?).should == true
end

Then(/^user can see navigation menu$/) do
  (@browser.element(:class, 'navigation').present?).should == true
end

When(/^user do mousover on the L1 (.*)$/) do |l1|
  menu_list_item_ = "menu_list_item_" + l1
  @l1 = @browser.element(:class, menu_list_item_ )
  @l1.hover
  @l1_name = @browser.element(:class, menu_list_item_ ).text
  end

Then(/^user should see L2$/) do
  (@browser.element(:class, 'level_2').wait_until_present.present?).should == true
end

And(/^user should see L3$/) do
  (@browser.element(:class, 'level_3_list').present?).should == true
 end

When(/^user press on search field$/) do
  @browser.element(:class, 'show_searchbar_button').click
end

Then(/^user should see search field$/) do
  (@browser.element(:class, 'search_input').wait_until_present.present?).should == true
end

Then(/^should field should be closed$/) do
  sleep(1)
  (@browser.element(:class, 'search_input').present?).should == false
end

Then(/^verify that user can see Email field in the footer$/) do
  @browser.execute_script('arguments[0].scrollIntoView();', @browser.element(:class, 'footer'))
  @browser.element(:class, 'footer_left_column').element(:class, 'footer_newsletter_box').present?.should == true
end

And(/^verify that find a store field is present in the footer$/) do
  (@browser.element(:class, 'footer_storelocator').present?).should == true
end

And(/^verify that social links are present in the footer$/) do
  @browser.element(:class, "social_links_title").present?.should == false

end

Then(/^verify that footer navigation links are present$/) do
  (@browser.element(:class, 'footer_social_networking_asset').present?).should == true
end


And(/^verify that Country selector isn't visible in header$/) do
  @browser.element(:class, 'countries-selection').present?.should == false
end

Then(/^verify that 'olapic' section is not displayed$/) do
  @browser.element(:class, 'olapic').present?.should  == false
end


When(/^user presses on Guaranteed Logo$/) do
  @browser.element(:class, 'guaranteed-logo').click
end

Then(/^close the Guaranteed pop-up$/) do
  (@browser.element(:class, "guaranteed_dialog").wait_until_present.present?).should == true
  @browser.element(:class, "guaranteed_dialog").element(:class, 'ui-dialog-titlebar-close').click
end

Then(/^user verifies that  Guaranteed pop\-up is closed$/) do
  sleep (1)
  (@browser.element(:class, "guaranteed_dialog").present?).should == false

end

And(/^verify that user can't see country sector$/) do
  @browser.element(:class, "countries-selection").present?.should == false

end

And(/^verify that payment icons are not present$/) do
  @browser.element(:class, "footer-payments-asset").present?.should == false
end

And(/^user verify that email sign up pop\-up is present$/) do
  pending
end


When(/^user pres on sign up button$/) do
  @browser.element(:class, 'modal_email_signup').button(:name, 'dwfrm_newsletter_signup').click
end

Then(/^user should see validation error for email (.*)$/) do |emailerror|
  (@browser.element(:class, 'modal_email_signup').text.include? (emailerror.force_encoding 'utf-8')).should == true
end

And(/^user should ses validation error for privacy\-policy (.*)$/) do |pperror|
  (@browser.element(:class, 'modal_email_signup').text.include? (pperror.force_encoding 'utf-8')).should == true

end

Then(/^user fills email field for email subscription pop\-up with (.*)$/) do |wrongemail|
  @browser.element(:class, 'modal_email_signup').text_field(:id, 'dwfrm_newsletter_email').to_subtype.clear
  @browser.element(:class, 'modal_email_signup').text_field(:id, 'dwfrm_newsletter_email').set(wrongemail)

end

When(/^user fills email field with email$/) do
  @browser.element(:class, 'modal_email_signup').text_field(:id, 'dwfrm_newsletter_email').to_subtype.clear
  @browser.element(:class, 'modal_email_signup').text_field(:id, 'dwfrm_newsletter_email').set(@email + '@gmail.com')

end

Then(/^user checks the privacy policy$/) do
  @browser.element(:class, 'modal_email_signup').element(:xpath, ".//*[@id='dwfrm_newsletter']/fieldset/div[1]/div/label[2]/span").click
end

Then(/^user should see thank you pop\-up$/) do
  @browser.element(:class, 'newsletter_subscribe_confirm').wait_until_present.present?.should == true
end


When(/^user press on subscribe button form footer$/) do
  @browser.execute_script('arguments[0].scrollIntoView();',  @browser.element(:class,"full-width footer-zone-3"))
  @browser.element(:css, 'div.footer_newsletter_box > div.js_newsletter_subscribe_content.js_newsletter_subscribe > #dwfrm_newsletter > fieldset > button[name="dwfrm_newsletter_signup"]').click
sleep(1)
end

  
And(/^user should see validation message for privacy and policy (.*)$/) do |pperror|
  @browser.element(:class, 'footer-zone-2').text.include? (pperror.force_encoding 'utf-8')
end

And(/^user should see validation message for email_footer (.*)$/) do |emailerror|
  @browser.element(:class, 'footer-zone-2').text.include? (emailerror.force_encoding 'utf-8')

end

Then(/^user press on privacy and policy checkbox$/) do
  @browser.element(:class, 'footer-zone-2').element(:id, "dwfrm_newsletter_acceptprivacypolicy_03").click
end

And(/^user fills email field from footer with incorrect email (.*)$/) do |wrongemail|
   @browser.text_field(:id, 'dwfrm_newsletter_email_03').set wrongemail
end


When(/^user fills email field from footer with incorrect email$/) do
  @browser.text_field(:id, 'dwfrm_newsletter_email_03').set @email+'@gmail.com'

end

When(/^user do mousover on newsletter link from header$/) do
  @browser.element(:class, 's_newsletter_subscribe_link').hover
end

Then(/^user should see newsletter pop\-up$/) do
  @browser.element(:class, 'sign_up_slot').wait_until_present.present?.should == true
end

When(/^user press on subscribe button form pop\-up$/) do
  @browser.element(:class, 'sign_up_slot').element(:xpath, ".//*[@id='dwfrm_newsletter']/fieldset/button").click
end

Then(/^user should see error message for email from pop\-up (.*)$/) do |erroremail|
  @browser.element(:class, 'sign_up_slot').text.include? erroremail.force_encoding 'utf-8'
end

Then(/^user should see error message for p&p (.*)$/) do |errorpp|
  @browser.element(:class, 'sign_up_slot').text.include? errorpp.force_encoding 'utf-8'
end


Then(/^user press on privacy and policy checkbox from newsletter pop\-up header$/) do
  @browser.element(:class, 'sign_up_slot').element(:xpath, ".//*[@id='dwfrm_newsletter']/fieldset/div[2]/div/label/span").click
end

And(/^user fills email field from email pop\-up with incorrect email (.*)$/) do |wrongemail|
  @browser.element(:class, 'sign_up_slot').text_field(:id, 'dwfrm_newsletter_email').set wrongemail
end

When(/^user fills email field from footer with correct email from newsletter pop\-up header$/) do
  @browser.element(:class, 'sign_up_slot').text_field(:id, 'dwfrm_newsletter_email').set @email+"@gmail.com"

end