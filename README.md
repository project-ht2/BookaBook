# Bôkabook 

**Bôkabook** is a Ruby on Rails website that connects members to a community of readers. Use Bôkabook to find a book to borrow or share your books with readers.

Group-1: **hoangtan223**, **suns3t**, **valentine** 

URL: **https://bokabook.herokuapp.com**

## User Stories

### Required:

#### Authentication
* [ ] User can register a new account.
* [ ] User can login to the application.
* [ ] User can logout from the application.

#### User profile
* [ ] After login, user can view his/her profile.
* [ ] After login, only user can edit his/her profile.

#### Search
* [ ] User can search for a person.
* [ ] User can search for a book in system book list.

#### Book management
* [ ] User can create a new book to system book list.
* [ ] User add book-items (listed in system book list) to his/her default bookshelf.
* [ ] User can view a book details.
* [ ] User can rate a book.
* [ ] User can review a book.

#### Book a book
* [ ] User can see a list of book lending offers.
* [ ] User can make a booking request if the book is available.
* [ ] User can add a book to "want to read" list if it is not available.
* [ ] User can receive notifications of booking requests.
* [ ] User can accept booking request from other.
* [ ] Lender can review borrower (on "book care" and "time accuracy" as) reputation reference.

#### User
* [ ] User can view other's profile.
* [ ] User can view other's transaction history.
* [ ] User can see reviews about other users.

### Optinal:

* [ ] User can create a bookshelf.
* [ ] User can edit a bookshelf info.
* [ ] User can see trendy books.
* [ ] User can follow/unfollow a person.
* [ ] User can login with facebook.
* [ ] User can receive email when receiving booking request.
* [ ] Borrower and lender can have a converstion for each booking request.
* [ ] Lender can require a deposit for each booking request.
* [ ] Borrower can receive notification and remind email 3 days before due date.
* [ ] Lender can receive notification on due date.

## Survey:
[Questionnaire](https://goo.gl/forms/jSie8SQmXb7rW6EI2)

[Result](https://docs.google.com/spreadsheets/d/1LCeMlwW2oHtPqoryIa14aRm9EkobzW2U9z_Mx0BfQPQ/edit?usp=sharing)

## Database schema:
![alt text](https://raw.githubusercontent.com/project-ht2/BookaBook/master/bokabook_erd.png "Data")

## Logo:
<img align="top" src="https://raw.githubusercontent.com/project-ht2/BookaBook/master/bokabook_logo.png" width="200">

## Color guide:
<a href="http://www.colourlovers.com/palette/1930/cheer_up_emo_kid" target="_blank"><img src="http://www.colourlovers.com/images/badges/p/1/1930_cheer_up_emo_kid.png" style="width: 240px; height: 120px; border: 0 none;" alt="cheer_up_emo_kid" /></a><br /><span style="font-size: 10px; color: #5e5e5e;"><a href="http://www.colourlovers.com/color" target="_blank" style="font-size: 10px; color: #5e5e5e;">Color</a> by <a href="http://www.colourlovers.com/" target="_blank" style="font-size: 10px; color: #5e5e5e;">COLOURlovers</a></span>

## Some wireframes
<img align="top" src="https://raw.githubusercontent.com/project-ht2/BookaBook/master/1_home.png" width="200">
<img align="top" src="https://raw.githubusercontent.com/project-ht2/BookaBook/master/2_my_profile.png" width="200">
<img align="top" src="https://raw.githubusercontent.com/project-ht2/BookaBook/master/3_others_profile.png" width="200">
<img align="top" src="https://raw.githubusercontent.com/project-ht2/BookaBook/master/4_book_details.png" width="200">
<img align="top" src="https://raw.githubusercontent.com/project-ht2/BookaBook/master/5_booking_request.png" width="200">
<img align="top" src="https://raw.githubusercontent.com/project-ht2/BookaBook/master/6_borrower_transaction_view.png" width="200">
<img align="top" src="https://raw.githubusercontent.com/project-ht2/BookaBook/master/7_lender_transaction_view.png" width="200">
<img align="top" src="https://raw.githubusercontent.com/project-ht2/BookaBook/master/8_create_account.png" width="200">

## Notes

Describe any challenges encountered while building the app.

### How to enable Unaccent extension for PostgreSQL

This extension help us to remove accent on Vietnamese words, then it can be searched from database

1. Install from Ubuntu repository:
~~~ 
sudo apt-get update
sudo apt-get install postgres-contrib
~~~
2. Create extension on our database:
~~~
psql BookaBook_development -c "CREATE EXTENSION \"unaccent\""; 
~~~
3. Restart **postgres** server:
~~~
sudo service postgresql restart
~~~

Now it's ready to go. You can type in Vietnamese words on Search book and look for vietnamese books also.


## License

    Copyright [2016] [HT2 GROUP - HOANG, TAN & TIEN]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.