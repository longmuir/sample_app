require 'spec_helper'

describe "StaticPages" do

	let(:base_title) {"Ruby on Rails Tutorial Sample App" }

  subject { page }
  #Refactoring from Chapter 5, exercise 1:
  shared_examples_for "all static pages" do
    it { should have_selector('h1',     text: heading) }
    it { should have_selector('title', text: full_title(page_title)) }
  end

  describe "Home page" do
    before { visit root_path }
    let (:heading) { 'Sample App' }
    let (:page_title) { '' }

    it_should_behave_like "all static pages"
    it { should_not have_selector 'title', text:'| Home' }
  end

  #Refactoring from Chapter 5.3.4

  describe "Help page" do
    before { visit help_path }

  	it { should have_selector('h1', text: 'Help') }
  	it { should have_selector('title', text: full_title('Help')) }
  end

  # Note the first two describe blocks have been refactored..
  # The second two have been left unfactored for educational purposees
  # Note: rspect automatically includes files in the 'support' folder.

  describe "About page" do 

  	it "should have the h1 'About Us'" do
  	  visit about_path
  	  page.should have_selector('h1', :text => 'About Us')
  	end

  	it "should have the right title" do 
  	  visit about_path
  	  page.should have_selector('title',
  		              :text => "#{base_title} | About Us")
    end
  end

  describe "Contact page" do

  	it "should have the content 'Contact'" do
  		visit contact_path
  		page.should have_selector('h1', :text=> 'Contact Us')
  	end

  	it "should have the right title" do
  		visit contact_path
  		page.should have_selector('title',
  					  			:text => "#{base_title} | Contact")
  	end
  end

  it "sould have the right links on the layout" do
    visit root_path
    click_link "About"
    page.should have_selector 'title', text: full_title('About Us')
    click_link "Help"
    page.should have_selector 'title', text: full_title('Help')
    click_link "Contact"
    page.should have_selector 'title', text: full_title('Contact')
    click_link "Home"
    click_link "Sign up now!"
    page.should have_selector 'title', text: full_title('Sign up')
    click_link "sample app"
    page.should have_selector 'title', text: full_title('')
  end

end
