module ManageAccount
	def delete_account(email, password)
			visit 'http://www.trustpilot.com/users/connect?redirect=/'
			@tp_login_with_page = TrustpilotLoginWithPage.new
			@tp_login_with_page.facebook_login_btn.click
			@popup = FaceBookLoginPopUp.new
			@popup.log_in_first_time(email, password)
			@tp_user_profile_page = TrustpilotProfilePage.new
			@tp_user_profile_page.edit_settings_link.click
			@tp_user_profile_page.account_settings_link.click
			@tp_user_profile_page.deleteUserButton.click
			page.driver.browser.switch_to.alert.accept
	  end
end

World(ManageAccount)