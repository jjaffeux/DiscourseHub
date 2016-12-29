# Discourse Hub

The Discourse Hub aims to improve discoverability of all the sites using Discourse.


## Goals

- Provide a form to submit sites
- Display sites by tags
- Display featured sites
- Provide an API to query sites


## Getting started

### Architecture

The app has a frontend (Vue.js/ES2015) and a backend (Rails/Postgres).

The JS tests are done with Karma/Mocha.


### Install

You need a recent version of ruby installed (currently tested on 2.3.x)

In app root:
- brew install yarn
- yarn
- bundle install


###  Start the app

- rails s
- npm run dev


### Start tests

- npm run test
