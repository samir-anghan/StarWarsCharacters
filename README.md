# StarWarsCharacters
This is a simple iOS Application project listing the Star Wars Characters with details. 
## Goals
- Implement a network layer in pure Swift without any third-party libraries
- Structured using the MVVM design pattern
- Achieve infinite scrolling and take advantage of the iOS Prefetching API
- Handling networking call failures by displaying proper alerts
- Focus on code quality, architecture and efficiency (No any third party code)
## Future Goals
- Add unit tests
##  Features
- Show a list of all star wars characters (infinite scrolling)
- Tapping on the name of a person in the list, shows detail view with Name, Year of Birth, Gender, Physical attributes
- Still part of detail view of a person, for each film a person appears; shows the name of the film and show the number of words in the opening crawl.
## Requirement
- iOS 13.0 or newer

## IMPORTANT NOTE
Intentionally, I have avoided sorting the a list of all star wars characters alphabetically because I have implemented an Infinite Scrolling UITableView using a paginated REST API.

## API used
[Star Wars API](http://swapi.co/)
