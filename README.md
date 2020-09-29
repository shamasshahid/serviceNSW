# RegoApp

RegoApp pulls Registration List from backend and displays to the user. The user can select a registration and view the details. 


## Design Considerations

### MVVM 
The app uses MVVM design to separate the views from business logic. This helps with testing the view models independently.


### Dependency / Protocol Oriented Programming
Instead of relying on concrete classes, entities rely on protocols. If we have to change the underlying development, we can do so easily without changing the entities that rely on them. 

For example, in testing, instead of actual servies, we replace them with `MockService`.

### Network

Network calls rely on 2 protocols, `Routable` and `WebService`. Splitting these two up, helps us decouple routing information from the network call logic. Their concrete implementation are `RegistrationsListRouter` and `RegistrationsListService`. 

## Unit Testing

For now we have unit testing in place for ViewModels `RegistrationsListViewModel`, `RegistrationDetailCellViewModel`. To setup the unit tests, we have setup Mock objects for Router and Service which are fetched from `MockProvider`.