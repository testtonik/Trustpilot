class TrustpilotHomePage < SitePrism::Page

	set_url 'http://www.trustpilot.com'
	element :profile_img, 'img#ProfileImageNav'
	elements :sign_up_links, :xpath, "//a[text()='Sign up']"
	elements :log_in_links, :xpath, "//a[text()='Log in']"


	def sign_up
		self.sign_up_links[0].click
	end

	def go_to_profile
		find_link('Go to my profile').click if find_link('Go to my profile').visible?
	end

	def log_off
		find_link('Log off').trigger('click')
	end

end
