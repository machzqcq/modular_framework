When(/^I open "([^"]*)" website$/) do |url|
  visit url
end

Then(/^I login using credentials "([^"]*)" and "([^"]*)"$/) do |username, password|
  sign_in(username,password)
end

Then(/^I contact customer service with order reference "([^"]*)" and message "([^"]*)"$/) do |order_ref, message|
  contact_customer_service(order_ref,message)
end