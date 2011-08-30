Feature: Tutorials
  In order to value
  I want see the tutorials
	
	Background: 
		Given there is a user with email "member@nerdgem.com" and password "secret"
	  And there is a tutorial with title "Ruby tutorial" created by "member@nerdgem.com"
		
	Scenario: I can see all the tutorials
	  Given I am on the tutorials page
	  Then I should see "Ruby tutorial"
