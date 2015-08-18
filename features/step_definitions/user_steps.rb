# User steps

Given(/^that I am using the system$/) do
end

When(/^a user exists with the following values:$/) do |table|
  # table is a Cucumber::Core::Ast::DataTable
  @user_values = table.rows_hash
  user = User.create(:firstname => @user_values['firstname'], :lastname => @user_values['lastname'])
  user.save
end

When(/^I visit the users page$/) do
  visit path_to("the users page")
end

# End user steps