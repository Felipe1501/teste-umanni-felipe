# README

Teste Umanni Felipe
This project is a Ruby on Rails application designed as a test for Umanni. It includes basic functionalities such as creating, reading, updating, and deleting posts. It can be run using Docker or directly on your local machine.

Table of Contents
Getting Started
Running with Docker
Running Without Docker
Useful Commands
Contributing
Getting Started
Prerequisites
To run this application, you need the following tools installed on your machine:

Docker and Docker Compose (if using Docker)
Ruby (version 3.2.3) and Bundler (if running locally)
Node.js and Yarn (for frontend dependencies)
SQLite or PostgreSQL (for database setup)


## Running with Docker
To run the application using Docker, follow these steps:

1.Clone the repository:

git clone https://github.com/Felipe1501/teste-umanni-felipe.git
cd teste-umanni-felipe

2. Build and start the containers:

docker-compose up --build

3. Access the application in your browser at:
http://localhost:3000

## Running Without Docker
If you prefer to run the application without Docker, follow these steps:

1. Clone the repository:

git clone https://github.com/Felipe1501/teste-umanni-felipe.git
cd teste-umanni-felipe

2. Install Ruby dependencies:

bundle install

3.Install frontend dependencies:

yarn install

4. Set up the database:

rails db:setup