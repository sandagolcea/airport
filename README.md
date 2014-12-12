Airport Challenge
=================

What does it do?
-------

Controls the flow of planes at an airport. 
The planes can land and take off provided that the weather is sunny. 
Occasionally it may be stormy, in which case no planes can land or take off. 

CRC
---------------

##Plane
Responsibility | Collaborators
--------------------------------
Take off       |    Airport
Land 		   |	Airport
is_flying?	   |	   -


##Airport
Responsibility | Collaborators
--------------------------------
Take off       |    Airport
Land 		   |	Airport
is_full?	   |       -



Points of interest
---------------

* Tests pass
* Tests coverage is good
* The code is elegant: every class has a clear responsibility, methods are short etc.

Documentation
--------------

* [Rspec-mocks](https://www.relishapp.com/rspec/rspec-mocks/docs)