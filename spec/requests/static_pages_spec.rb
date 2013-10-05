require 'spec_helper'

describe "StaticPages" do
	describe "home page" do
		it "should have the content 'usydconnect'" do
			visit home_path
			expect(page).to have_content('usydconnect')
		end
	end

	describe "help page" do
		it "should have the content 'Help'" do
			visit help_path
			expect(page).to have_content('Help')
		end
	end

	describe "about page" do
		it "should have the content 'About Us'" do
			visit help_path
			expect(page).to have_content('About Us')
		end
	end
end



