# encoding: utf-8
Given /^a seller visits the signin page$/ do 
  visit signin_path  
end

When /^he submits invalid signin information$/ do
  click_button "Sign in"
end

Then /^he should see an error message$/ do
  page.should have_selector('div.alert.alert-error')
end

Given /^the seller has an account$/ do
  @seller = Seller.create(name: "Timofey", password: "traf333", password_confirmation: "traf333")
end
    
When /^the seller submits valid signin information$/ do
  visit signin_path
  fill_in "Имя", with: @seller.name
  fill_in "Пароль", with: @seller.password
  click_button "Sign in"
end

Then /^he should see his profile page$/ do
  page.should have_selector('title', text: @seller.name)
end

Then /^he should see a signout link$/ do
  page.should have_link('Sign out', href: signout_path)
end