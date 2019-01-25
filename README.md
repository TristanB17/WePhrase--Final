# WePhrase

__Ruby Versions__
* Ruby version: 2.4.1
* Rails version: 5.2.0

### The Main Focus of this Project

This app was designed to provide an initial platform for language learning enthusiasts to both translate text in a target language as well as allow other users of the site to vote on the quality of a translation. A user will first search a term of their choice/in their area of interest in the desired language 

![Settings Window](https://i.imgur.com/ketTxhj.png)

![Settings Window](https://i.imgur.com/SFqKduL.png)

Should the user submit a translation, both the sentence translated and the translation are stored in the database. The Yandex API will then return a translated version in the user's language (limited to English for now), as well as return any other users' translations of that sentence, enabling a user to compare their translation with other existing translations. 

![Settings Window](https://i.imgur.com/91MSs0M.png)

## Technologies Utilized

The app itself is a minimalistically styled Ruby on Rails app, with some node.js components (and the jQuery library) included to enable a more responsive front-end. All translation cards are rendered with JavaScript and created in a Postgres database to enable them to have unique ids and be referenced as such. In addition, the use of JavaScript in the frontend allowed for easier rendering of additions to a translation with the help of AJAX (Asynchronous JavaScript and XML). 

The APIs used include the wikipedia API, and the yandex translator API. The google translate API was originally planned to be incorperated into the app, but due to budgetary constraints, it was not possible. Because of the nature of the wikipedia API, some finessing had to be done server side to retrieve the correct text, especially when filtering out unneeded HTML tags. 

The App is tested using mainly RSpec with Capybara.

## Initial Setup

1. Clone this repo into the desired folder with the command

  ```shell
  git clone git@github.com:TristanB17/WePhrase--Final
  ```
2. Change into the `WePhrase--Final` directory

3. Install the dependencies of the starter kit

  ```shell
  bundle install
  bundle update
  npm install
  ```
  
## Running the Server Locally

To run the code locally, use the command:

```shell
rails s
```

Once the server is running, enter this address:

* `http://localhost:3000/` into a browser to run your application.

## Deployment

* The page can also be viewed using the hosting site [Heroku](https://wephrase.herokuapp.com/)

* An email address is required to sign up
