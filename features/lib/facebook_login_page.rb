class FaceBookLogin < SitePrism::Page
	set_url 'https://www.facebook.com'
	element :email, '#email'
	element :password, '#pass'
	element :login,  :xpath, "//input[@value='Log In']"

	def log_in (email,password)
		self.email.set email
		self.password.set password
		self.login.click
		sleep 10
	end

end
