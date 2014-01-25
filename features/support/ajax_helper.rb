module AjaxHelpers

	def wait_for_title(page_title)
		current_title = page.find("head title").text
	  until current_title == page_title
			current_title = page.find("head title").text
	  end
	end

	def wait_for_new_ticket(ticket_text)
		new_ticket_text = page.all(".subject").last.text
	  until new_ticket_text == ticket_text
		  new_ticket_text = page.all(".subject").last.text
	  end
	end

	def generate_random_string
		o = [('a'..'z'), ('A'..'Z')].map { |i| i.to_a }.flatten
		message_string = (0...50).map { o[rand(o.length)] }.join
	end

	def wait_for_ajax
		  Timeout.timeout(10000) do
		    active = page.evaluate_script('jQuery.active')
		    until active == 0
		      active = page.evaluate_script('jQuery.active')
		    end
		  end
	end

	def last_json
	  page.source
	end

end

World(AjaxHelpers)