# User steps

Given(/^that I have reset the database$/) do
  User.destroy
  Account.destroy
  Transaction.destroy
end

When(/^users exist with the following values:$/) do |table|
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

Given(/^there is a user with an name of "([^"]*)"$/) do |arg1|
  user = User.create(:firstname => "Alice", :lastname => "ALICE")
  user.save
end

And(/^she has accounts with the following balances$/) do |table|
  # table is a Cucumber::Core::Ast::DataTable
  
  user = User.first
  account_values = table.hashes.each do |row|
    account = Account.create(:balance => row[:balance])
    account.save
    user.accounts << account
    user.save
  end

end

When(/^I visit the accounts page for "([^"]*)"$/) do |name|
  user = User.first(:firstname => "#{name}") 
  visit("/#{user.id}/accounts")
end

# End user steps