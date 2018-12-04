# pelican-prototype
This repository contains a high-fidelity prototype for the iOS app _Pelican_. Pelican is an app for people who have just moved to a new country. These newcomers are often uncomfortable interacting with locals, and they may find it hard to meet new friends. Pelican provides challenges that newcomers can complete, which force them to get out of their comfort zone and meet new people. Newcomers gain points for completing challenges, and they can compete with friends and track their progress over time.

This prototype was created for CS 147 (Intro to Human-Computer Interaction Design) at Stanford University. The Pelican [website](https://hci.stanford.edu/courses/cs147/2016/au/projects/LearningEducation/Pelican/) provides more details about the app and the development process.

## Screenshots
<img src="http://jackswiggett.com/img/pelican-screenshots/pelican00.png" width="200px" alt="Pelican screenshot 1" />
<img src="http://jackswiggett.com/img/pelican-screenshots/pelican01.png" width="200px" alt="Pelican screenshot 2" />
<img src="http://jackswiggett.com/img/pelican-screenshots/pelican02.png" width="200px" alt="Pelican screenshot 3" />
<img src="http://jackswiggett.com/img/pelican-screenshots/pelican03.png" width="200px" alt="Pelican screenshot 4" />
<img src="http://jackswiggett.com/img/pelican-screenshots/pelican04.png" width="200px" alt="Pelican screenshot 5" />
<img src="http://jackswiggett.com/img/pelican-screenshots/pelican05.png" width="200px" alt="Pelican screenshot 6" />
<img src="http://jackswiggett.com/img/pelican-screenshots/pelican06.png" width="200px" alt="Pelican screenshot 7" />

## Limitations
This is a prototype, and many features that would be present in the final application have been omitted. These include:
* A list view to complement the map view of the “Discover” page, with a searchable, filterable list of solo and group challenges.
* The UI flow to join an existing group challenge.
* Getting points for completed challenges.
* An x-axis with dates for the graphs on the “Progress” page.
* A different “active challenge” page for group challenges, which would show the time and location of the challenge and allow you to chat with the other participants.
* On the “attempt challenge” page (when you tap the arrow on a challenge bubble on the map), a list showing the names and profile pictures of your friends who have completed that challenge.
* An introductory tutorial explaining the design of the app, particularly how to use the discover map.

The application is also built using hard-coded data for the challenges, feed, points,
leaderboard, etc. All data will be reset when the application is reloaded. This means that
the user's active challenges list will be emptied.
