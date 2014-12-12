Airport Application
=================

What does it do?
-------

Controls the flow of planes at an airport. 
The planes can land and take off provided that the weather is sunny. 
Occasionally it may be stormy, in which case no planes can land or take off. 

CRC
---------------

##Plane
Responsibility | Collaborators  | Status
---------------|----------------|----------
is_flying?	   |	   -        |  Done
Take off       |    Airport     |  Done
Land 		   |	Airport     |  Done



##Airport
Responsibility | Collaborators   | Status
---------------|-----------------|---------
is_full?	   |       -         | Done
Take off       |     Plane       | Done
Dock Plane     |     Plane       | Done
Release Plane  |     Plane       | Done



Points of interest
---------------

* Tests pass
* Tests coverage is good
* The code is elegant: every class has a clear responsibility, methods are short etc.

Documentation
--------------

* [Rspec-mocks](https://www.relishapp.com/rspec/rspec-mocks/docs)