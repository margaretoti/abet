Feature:
Given a course does not have outcomes associated with it
And a user goes to view outcomes
Then the user has the option to create custom outcomes

Background:
	Given a Touchstone authenticated user
	And a user with access to multiple departments
	And a department has the following courses:
	|Course Number|Course Name              |
	|2            |Mechanical Engineering        |
	|2A           |MechE Flexible|
	And I view the department's landing page
	
Scenario: User chooses to set up custom outcomes
	  Given a course has no outcomes associated with it
	  When a user goes to view the outcomes
	  And user is taken to an interstitial page
	  And user chooses to set up custom outcomes
	  Then user sees the custom outcomes interface




