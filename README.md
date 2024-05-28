# Ruby on Rails: Registration Confirmation

## Project Specifications

**Read-Only Files**
- spec/*

**Environment**  

- Ruby version: 3.2.2
- Rails version: 7.0.0
- Default Port: 8000

**Commands**
- run: 
```bash
bin/bundle exec rails server --binding 0.0.0.0 --port 8000
```
- install: 
```bash
bin/bundle install
```
- test: 
```bash
RAILS_ENV=test bin/rails db:migrate && RAILS_ENV=test bin/bundle exec rspec
```
    
## Question description

In this challenge, you are part of a team that is building a chat platform. One requirement is for a REST API service to register users using the Ruby on Rails framework. You will need to add functionality to send a registration confirmation email. The team has come up with a set of requirements for the email format that should be delivered to users.

The definitions and detailed requirements list follow. You will be graded on whether your application performs email-sending based on given use cases exactly as described in the requirements.


Each user has the following structure:

* id: The unique ID of the user.
* email: The unique email of the user.
* username: The unique name of the user.
* password: The user's password.

The REST service should implement the following functionalities:

The `POST /registrations` endpoint should send a registration confirmation email upon successful user registration. The email should satisfy the following conditions:
  
* The email should be sent to the user's email address.
* The email should be sent from registration@hackerrank.com.
* The email should have admin@hackerrank.com in Blind Carbon Copy (BCC).
* The email should have the "Reply To" field set as admin@hackerrank.com.
* The email should have the subject "Welcome to HackerRank!".
* The email should be available in both HTML and TEXT versions.
  * The text version of the email should contain "Hello {username}, thank you for registration in HackerRank!", where `{username}` is the name of the user.
  * The HTML version of the email should have the following structure, where `{username}` is the name of the user:
 
  ```
  Hello {username},
  Thank you for registration in HackerRank!
  ```
  
Your task is to complete the given project so that it passes all the test cases when running the provided rspec tests. The project by default supports the use of the SQLite database, but you can make use of any database to store the data by specifying the dependency in the _config/database.yml_ file.

## Sample request and response

`POST /registrations`

Example request:
```
{
  "email": "username@email.com",
  "username": "username",
  "password": "password"
}
```

Response:
```
{
  "id": 1,
  "email": "username@email.com",
  "username": "username"
}
```
