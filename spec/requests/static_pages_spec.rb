require 'spec_helper'

describe "StaticPages" do

  let(:base_title) { "For Uncle" }

  describe "Home pages" do

    it "should have the h1 'For Uncle'" do
      visit '/static_pages/home'
      page.should have_selector('h1', :text => 'For Uncle')
    end

    it "should have the title" do
      visit '/static_pages/home'
      page.should have_selector('title', :text => "#{base_title}")
    end

    it "should not have a custom page title" do
      visit '/static_pages/home'
      page.should_not have_selector('title', :text => '| Home')
    end

  end

  describe "Help pages" do

    it "should have the content 'Help'" do
      visit '/static_pages/help'
      page.should have_selector('h1', :text=> 'Help')
    end

     it "should have the title 'Help'" do
      visit '/static_pages/help'
      page.should have_selector('title', :text => "#{base_title} | Help")
    end
  end

  describe "About pages" do

    it "should have the content 'About'" do
      visit '/static_pages/about'
      page.should have_selector('h1', :text => 'About')
    end

     it "should have the title 'About Me'" do
      visit '/static_pages/about'
      page.should have_selector('title', :text => "#{base_title} | About Me")
    end
  end
end
