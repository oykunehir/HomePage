# Home Page Design and Implementation

This project was created with the MVP architectural structure based on the submitted designs. Use XCode version 12.5.1 and Swift version 5.4.2 to run the application.

The general schematic is explained below.

Since the demo application does not depend on a backend service, mock data is used and these are set in the LocalDataManager class.

## FeedController
The main login screen is this class and it has the tableView extension.

*Feed Protocol*
The data is sent here via FeedPresenter and the necessary UI changes are made in the view. If there is a logical problem with the general structure of the table and/or page, make changes here.

*Like Button Protocol*
UI changes related to the like button are made through this protocol. If the button is not working, changes should be made here.

## FeedPresenter
As it is said, since the app is not connected to the backend service, it receives information from the LocalDataManager and provides information flow through the FeedProtocol to make UI changes to the FeedController.

## FeedCell 
The cell structure used in the tables is defined here. See this page for UI change.

## ProfileController 
It is the user's page, there is a TableView extension.

*Profile Protocol* The data is sent here via ProfilePresenter and the necessary UI changes are made in the view. If there is a logical problem with the general structure of the table and/or page, make changes here.
Like Button Protocol:  This protocol is used so that the user can see the posts s/he likes.

## ProfilePresenter
It receives information from the LocalDataManager and provides information flow through the Profile Protocol to make UI changes to the ProfileController.

## Screenshots -- Simulator iPhone 12 Pro

<div align="center">
        <img width="20%" src="ScreenShots/Simulator Screen Shot - iPhone 12 Pro -1.png" alt="About screen" title="About screen"</img>
        <img height="0" width="8px">
        <img width="20%" src="ScreenShots/Simulator Screen Shot - iPhone 12 Pro -2.png" alt="List screen" title="List screen"></img>
        <img height="0" width="8px">
        <img width="20%" src="ScreenShots/Simulator Screen Shot - iPhone 12 Pro -3.png" alt="List screen" title="List screen"></img>
</div>
