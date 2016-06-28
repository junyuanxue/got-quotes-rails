# Game of Thrones Quotes Generator

## About :crown:

This is the server for my React web app [Game of Thrones Quotes Generator](https://github.com/junyuanxue/got-quotes-generator). It is built with Ruby on Rails and test-driven with RSpec-Capybara.

One might ask since there is a [GoT Quotes API](https://github.com/wsizoo/game-of-thrones-quotes) already, why am I building another? Well, this one would allow a user to add more quotes. But I think the main reason is I miss Rails and TDD.

## To run the server :speech_balloon:

Clone this repo and install dependencies:
```
$ git clone https://github.com/junyuanxue/got-quotes-rails.git
$ cd got-quotes-rails
$ bundle
```
Create database, load database schema and run the server:
```
$ rails db:setup
$ rails s
```

## Testing :white_check_mark:

This project was test-driven using RSpec-Capybara.

To run all the tests:
```
$ rspec
```

## Tools :wrench:
* Ruby on Rails
* RSpec-Capybara
* Factory Girl
* Faker

## Author :cat:
Junyuan Xue

[Github](https://github.com/junyuanxue)
| [CV](https://github.com/junyuanxue/cv)
| [Blog](https://spinningcodes.wordpress.com/)
