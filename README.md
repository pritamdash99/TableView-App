# TableView-App

Some Notes on TableView : 

While working with table views one needs to decide :
1. Number of sections (Eg  : 2 sections - NAme and Subject)
2. Number of rows in each section (Eg : 10 rows in first section and 4 rows in second section)
3. Content of each row along with how it should be displayed. 

Default view of a row is provided using UITableViewCell

A cell is a container of view for each row of TableView

All the above things are achieved using Delegation pattern

To Decide all the above things there is no direct property attached with a tableView control, instead a protocol is declared which has methods to decide these things.

A class which implements the given protocol becomes a delegate for tableView to decide number of rows, number of sections and view for each row.

Attaching a Screen recording of the working of this app.

https://user-images.githubusercontent.com/80701312/172697777-d58525ff-f5a4-413b-81b5-053c92107061.mp4


