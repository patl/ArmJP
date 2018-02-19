When(/^user do mouseover on the My account link from header$/) do
  sleep (3)
  @browser.element(:class, 'account_navigation_list_item').hover
end


Then(/^user should see the Log In pop\-up$/) do
  sleep (3)
  @browser.iframe(:class, 'login_iframe').wait_until_present.present?.should == true
end

Then(/^user verify that Social Log in section is present$/) do
  @browser.iframe(:class, 'login_iframe').element(:class, 'social_login').present?.should == true
end

Then(/^user fills the email filed with (.*)$/) do |email|
  @browser.iframe(:class, 'login_iframe').text_field(:xpath , "//form[@id='dwfrm_login']/fieldset/div[2]/div/input").to_subtype.clear
  @browser.iframe(:class, 'login_iframe').text_field(:xpath , "//form[@id='dwfrm_login']/fieldset/div[2]/div/input").set(email)
end

Then(/^user fills the password field with (.*)$/) do |password|
  @browser.iframe(:class, 'login_iframe').text_field(:id, 'dwfrm_login_password').to_subtype.clear
  @browser.iframe(:class, 'login_iframe').text_field(:id, 'dwfrm_login_password').set(password)
end

When(/^user press on Sign in button$/) do
  @browser.iframe(:class, 'login_iframe').element(:name, 'dwfrm_login_login').click
end

Then(/^user verify that My account was replace by Welcome$/) do
  @browser.element(:class, 'account_navigation_link').text.include? 'ようこそ'.should == true
end

When(/^user press on Registration button$/) do
  @browser.element(:id, 'my_account_slot').element(:class, 'button').click
end

Then(/^user redirects to Create account page$/) do
  @browser.element(:class, "register_page").present?.should == true
end

Then(/^user verify that social icons are present$/) do
  @browser.element(:class, 'gigyaLoginParent').present?.should== true
end

Then(/^user fills greeting by (.*)$/) do |greeting|
  if greeting == 'Mr'
        @browser.element(:xpath, "//form[@id='RegistrationForm']/fieldset/div/label[2]").click
  end

  if greeting == 'Mrs'
       @browser.element(:xpath, "//form[@id='RegistrationForm']/fieldset/div/label[3]").click
  end

  if greeting == 'Miss'
        @browser.element(:xpath, "//form[@id='RegistrationForm']/fieldset/div/label[4]").click
  end

end

And(/^fills first name field$/) do
  @browser.text_field(:id, 'dwfrm_profile_customer_firstname').to_subtype.clear
  @browser.text_field(:id, 'dwfrm_profile_customer_firstname').set(@name1)
end

And(/^fills last name field$/) do
  @browser.text_field(:id, 'dwfrm_profile_customer_lastname').to_subtype.clear
  @browser.text_field(:id, 'dwfrm_profile_customer_lastname').set(@name2)
  end


And(/^fills email field$/) do
  @browser.text_field(:id, 'dwfrm_profile_customer_email').to_subtype.clear
  @newemail = (@email + '@gmail.com')
  @browser.text_field(:id, 'dwfrm_profile_customer_email').set(@newemail)

end

And(/^fills confirmation email field$/) do
  confirmemail = (@email + '@gmail.com')
  @browser.text_field(:id, 'dwfrm_profile_customer_emailconfirm').set(confirmemail)
end

And(/^fills password field$/) do
  @browser.text_field(:id, 'dwfrm_profile_login_password').set("O"+@pass+"!123")
end

And(/^fills confirmation password field$/) do
  @browser.text_field(:id, 'dwfrm_profile_login_passwordconfirm').set("O"+@pass+"!123")
end

And(/^fills  Mobile number$/) do
  @browser.text_field(:id, 'dwfrm_profile_customer_mobile').set("06" + @phone)
end

And(/^fills Phone number$/) do
  @browser.text_field(:id, 'dwfrm_profile_customer_phone').set("07" + @phone)
end


And(/^fills DoB by (.*)$/) do |dob|
dob = @dob
  @browser.text_field(:id, 'dwfrm_profile_customer_birthday').to_subtype.clear
  @browser.text_field(:id, 'dwfrm_profile_customer_birthday').set(dob)
end

Then(/^user subscribe to the emails$/) do
  @browser.element(:class, 'formfield_add_to_email_list').click
end

Then(/^user presses on Create account button$/) do
  @browser.element(:css, '.button.submit_button').click
end

Then(/^user redirects to my account page (.*)$/) do |welcome|
  sleep (1)
  Watir::Wait.until{@browser.element(:class, 'account_navigation_list_item').text.include? (welcome.force_encoding 'utf-8')}.should == true
end


When(/^user press on Forgot password link$/) do
  @browser.iframe(:class, 'login_iframe').element(:xpath, "//form[@id='dwfrm_login']/fieldset/div[6]/a").click
end

Then(/^user should see reset password pop\-up$/) do
  @browser.element(:class, 'ui_resetpassword_dialog').wait_until_present.present?.should == true
end

When(/^user fills email field for reset password with (.*)$/) do |email|
  @browser.text_field(:id, 'dwfrm_requestpassword_email').set(email)
end


And(/^press on Send button for reset password$/) do
  @browser.element(:name, 'dwfrm_requestpassword_send').click
end

Then(/^user should see the Confirmation pop\-up for reset password$/) do
  @browser.element(:class, 'ui_resetpassword_confirm_dialog').wait_until_present.present?.should == true
end

When(/^user presses on Close button for confirmation button$/) do
  @browser.element(:class, "display_close_button").click
end

And(/^Confirmation password pop\-up is close$/) do
  @browser.element(:class, 'ui_resetpassword_confirm_dialog').present?.should == false

end


Then(/^user should see validation message for email (.*)$/) do |messageemail|
  (@browser.iframe(:class, 'login_iframe').element(:class, 'f_error_message').text.include? (messageemail.force_encoding 'utf-8')).should == true
end

And(/^user should see validation message for password (.*)$/) do |messagepassword|
  (@browser.iframe(:class, 'login_iframe').element(:id, "dwfrm_login").text.include? (messagepassword.force_encoding 'utf-8')).should == true
end

Then(/^user fills the email filed  (.*)$/) do |wrongemail|
  @browser.iframe(:class, 'login_iframe').text_field(:xpath , "//form[@id='dwfrm_login']/fieldset/div[2]/div/input").set(wrongemail)

end

And(/^user should see validation message for wrong email (.*)$/) do |wrongemailmessage|
  (@browser.iframe(:class, 'login_iframe').element(:class, 'f_error_message').text.include? (wrongemailmessage.force_encoding 'utf-8')).should == true

end

Then(/^user fills the password with (.*) =! email$/) do |wrongpass|
  @browser.iframe(:class, 'login_iframe').text_field(:id, 'dwfrm_login_password').set(wrongpass)

end

And(/^user should see validation message for wrong password (.*)$/) do |wrongpasswordmessge|
  sleep (1)
  (@browser.iframe(:class, 'login_iframe').element(:id, "dwfrm_login").text.include? (wrongpasswordmessge.force_encoding 'utf-8')).should == true

end

When(/^user click on  log out from account$/) do
  @browser.element(:id, 'my_account_slot').element(:class, 'logout_link').click
end

Then(/^user fills email$/) do
  @browser.iframe(:class, 'login_iframe').text_field(:xpath , "//form[@id='dwfrm_login']/fieldset/div[2]/div/input").set(@email + '@gmail.com')
end

And(/^user fills password$/) do
  @browser.iframe(:class, 'login_iframe').text_field(:id, 'dwfrm_login_password').set("O"+@pass+"!123")
end


When(/^user press on change password button$/) do
  @browser.element(:class, 'changepassword').click
end

Then(/^user fills old password field with (.*)$/) do |password|
  @browser.text_field(:id, 'dwfrm_resetpassword_currentpassword').set(password)
end

Then(/^user fills new password field with (.*)$/) do |newpass|
  @browser.text_field(:id, 'dwfrm_resetpassword_password').set(newpass)
end

Then(/^user fills confirmation password field with (.*)$/) do |newpass|
  @browser.text_field(:id, 'dwfrm_resetpassword_passwordconfirm').set(newpass)
end

When(/^user press on confirmation button for reset password$/) do
  @browser.element(:name, 'dwfrm_resetpassword_send').click
end

Then(/^user should see confirmation page for reset password$/) do
  @browser.element(:class, 'setnewpasswordconfirm-message').present?.should == true
end

Then(/^user presses on account settings link$/) do
  @browser.element(:id, 'my_account_slot').wait_until_present.present?.should == true
  @browser.element(:xpath, ".//*[@id='my_account_slot']/div[1]/div[2]/ul/li[1]/a/span").click
end


Then(/^user presses on edit account button$/) do
  @browser.element(:class, 'editprofile').click
end


When(/^user press on save button$/) do
  @browser.element(:class, 'submit_button').click
end

Then(/^user should see pop\-up$/) do
  @browser.element(:class, 'change-profile-dialog').present?.should == true
end

When(/^user press on OK button$/) do
  @browser.element(:class, 'change-profile-dialog').element(:class, 'profile-change-ok').click
end

Then(/^user verifies that data are changed$/) do
  @browser.element(:class, 'profile_firstname').text.upcase == (@name1.upcase)
  @browser.element(:class, 'profile_lastname').text.upcase == (@name2.upcase)
  (@browser.element(:class, 'email').text.include? @newemail).should == true
end

Then(/^user fills the old email filed with (.*)$/) do |email|
  @browser.text_field(:id, 'dwfrm_profile_customer_email').to_subtype.clear
  @browser.text_field(:id, 'dwfrm_profile_customer_email').set(email)

end


Then(/^Verify that user can see (.*) \+ last name \+ first name \+ 様$/) do |welcome|
  @browser.element(:class, 'login_link').text.include? (('ようこそ'.force_encoding 'utf-8' and "様".force_encoding 'utf-8'))end