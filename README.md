# README

This README file contain all necessary files needed for the Book Explorer application to be up and running.

Although the application has been deployed, as it is currently running on Heroku, with this url: https://thawing-earth-34190.herokuapp.com/

The application also covers the following:

* Runs on Ruby version 5.0

* System dependencies includes gem 'devise', 'bootstrap 4', 'transaction'

* Configuration includes AWS S3 for book uploads ('carrierwave-aws')

* Database creation

* Database initialization

* How to run the test Book-Explorer
	
	Testing the application on Heroku is easy(https://thawing-earth-34190.herokuapp.com/), just follow the below steps:
	-Sign-up if you do not have an account (else, just log in)
	-As new registered users, you are not able to view or access any uploaded CSV file(s) or book information.
	-Existing users that have registered and uploaded a CSV file(s), can have access to the files they have uploaded
	-You can upload a CSV file, going through the "CSV files" tab and using the "Upload CSV file" button.
	-You need to upload a CSV file as a new user, the file should contain book information (there is a sample .csv file attached at the root folder, known as 'book-info.csv').
	-The sample csv file has headers that should NOT be modified, but the book information can be modified, and additional list of books can be added.
	-Do not duplicate the "Unique identifier for the book" (UUID) section when adding more list of books, as the UUID has to be unique for all books.
	-Once the CSV file is uploaded, you can see both the csv file uploaded and the list of books in the csv file that was uploaded.
	-If for any reason, UUID get duplication, the file will not upload and will return an error message.


* Deployment instructions:  You can deploy it how you want, it uses MySQL and Postgres Database, just modify the database.yml file

* The application send a notification to an external service performing a post request every time a CSV file is uploaded.