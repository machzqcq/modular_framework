module Keywords

  def visit url
    @browser.goto url
  end

  def sign_in(username,password)
    @browser.link(text: OR['signin_text']).click
    @browser.text_field(id: OR['username_id']).set username
    @browser.text_field(id: OR['password_id']).set password
    @browser.button(id: OR['submit_login_id']).click
    expect(@browser.link(text: "Sign out").present?).to be_truthy
  end

  def contact_customer_service(order_ref,message)
    @browser.link(text: OR['contact_us_text']).click

    @browser.select(id: OR['subject_heading_id']).select "Customer service"
    @browser.text_field(id: OR['email_id']).set "pradeep@seleniumframework.com"
    @browser.text_field(id: OR['order_reference_id']).set order_ref
    @browser.text_field(id: OR['message_id']).set message
    @browser.button(id: OR['submit_message_id']).click
  end
end