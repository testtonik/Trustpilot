
class TrustpilotProfilePage < SitePrism::Page

	element :edit_settings_link, 'a#editprofilelink'
	element :account_settings_link, 'a#mypasswordlink'
	element :deleteUserButton, 'button#DeleteUserButton'


end