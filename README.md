# shutterstock_scroll

This is a mobile application that gets images from the Shutterstock api with infinite scroll functionality. The user can view a larger image when the use clicks on an image.

With the amount of images on the Shutterstock platform it would be impractical and almost impossible to download all the image data from the Shutterstock database.

The solution is to get a small selection of the most recent images and display them.

When it is necessary we should fetch more images. In this case of a scrollable list, we will fetch more images when the user has scrolled to the end of the list.

To do this wee need to fire a callback function that is trigged by the user reaching the end of the list.

We will give the ListView a scroll controller. With this we can listen to scroll events, every time the list is scrolled.

To calculate when we have reached the end of the list we will get the current scroll position of the ListView. If the current scroll position reaches a point where the position is equal to or greater than the maximum extent of the ListView then we must have reached the end. 

We check this with an IF statement, and if it is true we call the function to get more images.

Each time including the first we get 10 images. This is enough to fill most screens with an initial set of images. 

The Shutterstock endpoint to get more images, takes a query of the amount of images with each call(Images per page) and what page number you would like.

To make sure we keep getting the next page on each call, there is a integer in the main scoped model object that relates to the page number to call for. It starts at 0 on initialisation and with each call is incremented up by one. This makes sure on the next call the next batch(next page) of images is requested. 

When the images are returned in the response, the existing array of displayed images and the new array from the response are reduced into one and the listview is populated with the new data.

## Design choice

Being a simple small application I decided to implement the “Scoped Model” package.

I wanted to abstract my logic from my UI for clean elegant code so this was a perfect solution. 
There are not so many components relying on data change so a Bloc pattern with streams in my opion was not suitable and would be over engineering. Being a small application Redux was also going to be overkill here.

## Packages used.

- **scoped_model: ^1.0.1, cached_network_image: ^1.0.0  & flutter_cache_manager: ^1.0.0**
I used these packages to cache images and load them quicker. If the user uses the app regularly. Also this will save mobile data usage of the app.

- **shimmer: ^1.0.0**
A nice little UI package with gives a smooth transition for loading images. Teamed up with the *cached_network_image* you can add a shimmer placeholder.

- **flutter_launcher_icons: ^0.7.2+1**
This package was implement to create launcher icons for the App on both platforms and multiple devices.

- **mockito: ^4.1.0**
I used this package to mock classes and in particular, inject a Mock http client for testing purposes.

- **connectivity: ^0.4.3+5**
Because the application relies so much on the internet, this package is used to listen to changes in network connectivity.

- **fluttertoast: ^3.1.0**
This package is used to notify the user of any activities or state changes within the app. In this case it notifies the user when internet connection is lost.

## Tests
- Unit and widget tests are carried out on all components.
- Golden tests implemented on all widgets.
- Driver tests are not working correctly. See issues below.

## Workflow

**Tests** 
Tests were written after writing the code rather than writing tests first.

**CICD**
CICD workflow with NeverCode's Codemagic CICD tool is setup to run tests every time commits are pushed to this git repo. subscribers are notified with the results of the test by email or slack.

## UI

- Slivers and a custom scrollview are implemented to make the app bar disappear on scrolling. This maximises the viewport and gives the user the best experience.

**Animations**
- Hero animations are used to guide the user from the gallery to the full image view.
- The initial loading animation is used with a continuous rotation transition.

## Issues
- When trying to load a project file as mock JSON data an error was thrown. An issue is raised on the flutter GitHub project as no clear solution was given in the documentation and no solutions where on google searches or stack overflow. https://github.com/flutter/flutter/issues/35740.

- Flutter driver was not correctly locating the widgets with the SerializableFinder class. An issue is raised on the flutter GitHub project as no solutions or topics on the rest of the web could be found. https://github.com/flutter/flutter/issues/36244.

- When doing tests a error appears in the logs related the the "connectivity" package. An issue is raised on the flutter GitHub project https://github.com/flutter/flutter/issues/36440.

## Check out my page for my CV and general things about me
https://a-johnson-developer-berlin.herokuapp.com/


