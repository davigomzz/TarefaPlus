# TarefaPlus

![GitHub top language](https://img.shields.io/github/languages/top/davigomzz/tarefaplus)
![GitHub issues](https://img.shields.io/github/issues/davigomzz/tarefaplus)
![GitHub language count](https://img.shields.io/github/languages/count/davigomzz/tarefaplus)

## About the Project

**TarefaPlus** is a task management system built with Ruby on Rails, designed to make it easier to create and track school activities. The system has two interfaces, adapted according to the user’s role:

- **Teacher:** Can create tasks and assign them to specific classes, in this case only for high school classes.
- **Student:** Can view tasks assigned to their class, “take” tasks to their personal board, and update the status of tasks (for example: “To Do”, “In Progress”, and “Done”).

The system uses Devise for authentication and features an intuitive layout, including a kanban-style view for students.

## Technologies Used

- **Ruby on Rails 7.1** – Web framework used in the development.
- **SQLite3** – Native Ruby on Rails database used in the development environment.
- **Bootstrap 5** – CSS framework for modern, responsive design.
- **Devise** – Gem for user authentication.

## How to Run the Application

### Prerequisites
- **Ruby 3.3.4** – Make sure you have this Ruby version installed.
- **Node.js 18.17.1** – Make sure you have this Node.js version installed.
- **Rails 7.1.5** – Make sure you have this Rails version installed.
- **Bundler** – In case you don’t have it installed.

### Steps to run the application
1- Clone the repository 
  ```bash
  git clone https://github.com/davigomzz/TarefaPlus.git
  ```
2- Go into the cloned repository folder 
  ```bash
cd Tarefaplus
  ```
3- Install the dependencies
  ```bash
bundle install
  ```
4- Set up the database
  ```bash
rails db:create
rails db:migrate
rails db:seed
  ```
5- Start the server
  ```bash
rails server
  ```
6- Access the application in your browser
  ```bash
http://localhost:3000
  ```
  