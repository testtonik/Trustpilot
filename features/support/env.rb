#---
#---
require 'capybara/dsl'
require 'capybara/cucumber'
require 'capybara/poltergeist'
require 'page-object'
require 'site_prism'
require 'json_spec/cucumber'
require 'rest_client'
#require 'sauce/cucumber'

if ENV['IN_BROWSER']
  # On demand: non-headless tests via Selenium/WebDriver
  # To run the scenarios in browser (default: Firefox), use the following command line:
  # IN_BROWSER=true bundle exec cucumber
  # or (to have a pause of 1 second between each step):
  # IN_BROWSER=true PAUSE=1 bundle exec cucumber
	Capybara.default_driver = :selenium
	Capybara.default_wait_time = 15
  AfterStep do
    sleep (ENV['PAUSE'] || 0).to_i
  end
else
  # DEFAULT: headless tests with poltergeist/PhantomJS
  Capybara.register_driver :poltergeist do |app|
    Capybara::Poltergeist::Driver.new(app,js_errors: false, inspector: false, debug: 'chrome')
  end
  Capybara.ignore_hidden_elements = false
  Capybara.default_driver    = :poltergeist
  Capybara.javascript_driver = :poltergeist
  Capybara.default_wait_time = 15
end

