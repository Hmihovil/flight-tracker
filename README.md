## Project:
A flight tracking application that allows a user to enter the airline, flight number, destination, and departure time for a flight.

### Features:
1. Ability to add flights
2. Ability to delete flights

### Possible Bonus Features:
1. Add a date with selectors for year, month, and day. (Can available days change depending on which year and month it is? don't want 31 days showing in February) Store as month-day-year.
* Allow user to organize flights:
  * alphabetically by airline  
  * chronologically by departure time
  * alphabetically by destination

### Implementation:
* Airline should be text entry
* Flight number will be a number entry
* Destination should be full city (don't allow just airport abbreviation - check that it is more than 3 characters)
* Departure time needs to be 2 number selectors: hours and minutes - 24 hour clock.

Store flight details in an external YAML file?
Each flight creates a new object with readable instance variables: airline, flight number, destination, departure time.
That object is stored as a hash within an array in the YAML file.

## 2/25/19
Build out base Sinatra framework and view templates. Choose fonts. Style buttons. Realized flight number could contain a letter so switched it from a number field to a text input. Create view template for displaying table of flights.

## 2/26/19
Added add and delete flight functionality, complete with success messages. Opted to simply store flight details within the session, not in a YAML file.
Data structure is a hash of hashes. Each flight has its own identifier as Key then the value is all of the flight information.

## Further exploration
In order to allow the user to sort the view, I would need to:
* add sorting buttons for each filter criteria (airline, departure time, destination)
* add routes that correspond to each of those buttons (I believe they could be `get` routes)
* add methods to `sort_by` each criteria - specifically airline, departure, time. 
