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
Responsibility | Collaborators  
---------------|----------------
is_flying?	   |	   -        
status		   |       -        
Take off       |    Airport     
Land 		   |	Airport     



##Airport
Responsibility | Collaborators  
---------------|----------------
full?	       |       -   
empty?	       |       -        
capacity       |       -      
Dock Plane     |     Plane      
Release Plane  |     Plane      


To run tests
---------------
`git clone git@github.com:sandagolcea/airport.git`  
`rake` or `rspec`  

Points of interest
---------------

* Tests pass
* Tests coverage is good
* The code is elegant: every class has a clear responsibility, methods are short etc.

Documentation
--------------

* [Rspec-mocks](https://www.relishapp.com/rspec/rspec-mocks/docs)