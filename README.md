# README
This is most definitely a work in progress.

I do most of my dev work on a Windows based laptop.  I really like doing stuff with Ruby on Rails.
Most RoR stuff feel like it's Mac first, Linux second, Windows(?) haven't heard of it.

Since most of my apps have the same underlying tech this is intended to be a template of sorts.
Last night at our RoR Meetup we did an introduction to React.  So that's what's going on there.

Things you may want to cover:

* Ruby version - ruby 2.3.1p112 - (It's set by the container.)

* System dependencies - Docker, docker-compose

* Configuration - rename the .env.example to .env

* Database creation - I prefer to stand up the web container, connect to it and then run my rails db:setup

* Database initialization - see above

* How to run the test suite - Yeah... They don't exist for this.

* Services (job queues, cache servers, search engines, etc.) - You can look in the docker-compose.yml
  * Ruby on Rails
  * postgresql
  * redis
  * sidekiq
  * action_cable
  
* Deployment instructions
    You will need a recent version of Docker
    * Docker https://www.docker.com/products/docker
    * Docker-toolbox https://www.docker.com/products/docker-toolbox
    Install docker
    $ git clone https://github.com/outwitevil/template_react_demo.git
    $ docker-compose build
    $ docker-compose up -d
    Open a terminal into the web container after it starts up.
    Then run $ rails db:migrate


* ...
