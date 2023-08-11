# Installation

After downloading the project, you may run it as there are no external dependencies. I have added Lotie SPM dependency for loading screen


# Architecture

I used the VIPER architecture in the project, albeit with a slight flavour of my own here and there.

The project displays a users' credit score, and additional information when a user clicks the 'see detailed' button.

I added the optional functionality, namely pull to refresh on the main UI, which runs a service call when the tableView is refreshed


# Testing


# Design

The design and color scheme on the project is inspired by the clear score application

# Security

There are no security features added to the application.


# Whats missing?

There are some items I intentionally left out, because it wasn't priority or its negligible functionality.

The Service Call class was also not neccessary, the idea was to create a base class for all service calls going out, which will take the path as a parameter, but because we are only making one service call, I decided to leave it as is, there is a certain level of abstraction with the implementation, but not abstract enough because the path is hardcoded.

The back button treatment could have been handled better, for a more aesthetic UI, but its functional.

There is a service call when going back to the home UI, from the detail view, that implementation is intentional but I understand that the detail view doesn't perform changes to the backend which neccessitates the need to refresh the home view, I could have called the service once on load, and only refresh when the refreshControl is used.

I hope I have covered every thought process when working on the project.
