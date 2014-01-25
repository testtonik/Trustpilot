Given(/^I have Facebook account$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I visit Trustpilot homepage$/) do
	Capybara.current_session.driver.browser.manage.delete_all_cookies
	@tp_home_page = TrustpilotHomePage.new
	@tp_home_page.load
end

When(/^I click on 'Sign up' link$/) do
	@tp_home_page.sign_up_links[0].click
end

Given(/^I redirected to 'Sign up' page and I see 'Sign up on Trustpilot with' header$/) do
	page.should have_content('Sign up on Trustpilot with')
end

When(/^I click Facebook button$/) do
	@tp_login_with_page = TrustpilotLoginWithPage.new
	@tp_login_with_page.facebook_login_btn.click
end
Then(/^I can see Facebook login dialog$/) do
	@popup = FaceBookLoginPopUp.new
	@popup.log_in_first_time('testtonik@gmail.com', '_g0r0d0k_')
end

Then(/^I redirected to Home Page$/) do
	page.should have_content('Review and discover great companies!')
end

When(/^I click On my profile image$/) do
	@tp_home_page.profile_img.click
end

When(/^I click 'Go to my profile' link$/) do
	@tp_home_page.go_to_profile
end

Then(/^I navigated to my profile page$/) do
	@tp_user_profile_page = TrustpilotProfilePage.new
	@tp_user_profile_page.should have_content('Tom Jonsons profile')
end

Then(/^I can verify that my name is displayed$/) do
	@tp_user_profile_page.should have_content('Tom Jonsons profile')
end

Then(/^my DOB is displayed$/) do
	@tp_user_profile_page.should have_content('1971')
end

Then(/^I delete my account$/) do
	@tp_user_profile_page.edit_settings_link.click
	@tp_user_profile_page.account_settings_link.click
	@tp_user_profile_page.deleteUserButton.click
	page.driver.browser.switch_to.alert.accept
end

Then(/^I redirected to Home Page again$/) do
	page.should have_content('Review and discover great companies!')
end

When(/^I click on 'Log in' link$/) do
	@tp_home_page.log_in_links[0].click
end

Given(/^I redirected to 'Log in' page and I see 'Login to Trustpilot with' header$/) do
	page.should have_content('Login to Trustpilot with')
end