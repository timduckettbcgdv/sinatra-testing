# User steps

Given(/^that I am using the system$/) do
end

When(/^a user exists with the following values:$/) do |table|
  # table is a Cucumber::Core::Ast::DataTable
  user_values = table.hashes
  
  user_values.each do |values|
    user = User.create(:firstname => values['firstname'], :lastname => values['lastname'])
    user.save
  end
  
end

When(/^I visit the users page$/) do
  visit path_to("the users page")
end

# End user steps