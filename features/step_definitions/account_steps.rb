# Add a declarative step here for populating the DB with users
Given /the following users exist/ do |users_table|
  users_table.hashes.each do |user|
    User.create!(user)
  end
end

Given(/^I am logged in as "(.*?)"$/) do |user|
  pending # express the regexp above with the code you wish you had
  #page should have my name on it, or session should hold my username
end
