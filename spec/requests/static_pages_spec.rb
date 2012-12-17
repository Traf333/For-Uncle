require 'spec_helper'

describe "StaticPages" do

  describe "Home pages" do

    it "should have the content 'For Uncle'" do
      visit '/static_pages/home'
      page.should have_selector('For Uncle')
    end

    it "should have the title 'Home'" do
      visit '/static_pages/home'
      page.should have_selector('title', :text => " | Home")
    end
  end

  describe "Help pages" do

    it "should have the content 'Help'" do
      visit '/static_pages/help'
      page.should have_selector('Help')
    end

     it "should have the title 'Help'" do
      visit '/static_pages/help'
      page.should have_selector('title', :text => " | Help")
    end
  end

  describe "About pages" do

    it "should have the content 'About'" do
      visit '/static_pages/about'
      page.should have_selector('About')
    end

     it "should have the title 'About Me'" do
      visit '/static_pages/about'
      page.should have_selector('title', :text => " | About Me")
    end
  end
end
