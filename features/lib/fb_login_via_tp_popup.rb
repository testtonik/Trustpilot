class FaceBookLoginPopUp < SitePrism::Page
	element :email, '#email'
	element :password, '#pass'
	element :login,  :xpath, "//input[@value='Log In']"
	element :okay_btn, "button[name='__CONFIRM__']"

	def log_in (email,password)

		#Get the popup window handle
    popup = page.driver.browser.window_handles.last

		page.within_window popup do
	    self.email.set email
	    self.password.set password
	    self.login.click
#			self.okay_btn.click
#			sleep 3
#			self.okay_btn.click
		end

	end

	def log_in_first_time (email,password)

		#Get the popup window handle
    popup = page.driver.browser.window_handles.last

		page.within_window popup do
	    self.email.set email
	    self.password.set password
	    self.login.click
			self.okay_btn.click
			sleep 3
			self.okay_btn.click
		end

	end
end
