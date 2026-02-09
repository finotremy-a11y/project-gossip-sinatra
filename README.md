# The Gossip Project - Sinatra Edition

A simple web application built with Sinatra for sharing and managing gossips. This project demonstrates CRUD operations (Create, Read, Update, Delete) with a lightweight CSV-based storage system.

## Features

- **View All Gossips**: Browse a list of all gossips on the home page
- **Create Gossips**: Add new gossips with author name and content
- **View Details**: Click on any gossip to read the full content
- **Edit Gossips**: Modify the author and content of existing gossips
- **Delete Gossips**: Remove gossips from the collection

## Tech Stack

- **Framework**: [Sinatra](http://sinatrarb.com/) - Lightweight Ruby web framework
- **Storage**: CSV files (no database required)
- **Language**: Ruby 3.4.2
- **Template Engine**: ERB (Embedded Ruby)

## Installation

1. Clone or navigate to the project directory:
```bash
cd the_gossip_project_sinatra
```

2. Install dependencies:
```bash
bundle install
```

## Running the Application

Start the web server:
```bash
rackup -p 4567
```

The application will be available at `http://localhost:4567`

## Project Structure

```
├── config.ru              # Rack configuration file
├── Gemfile               # Ruby gem dependencies
├── README.md             # This file
├── db/
│   └── gossip.csv        # CSV file storing all gossips
├── lib/
│   ├── controller.rb     # Main Sinatra application with routes
│   ├── gossip.rb         # Gossip model with CRUD methods
│   ├── public/
│   │   └── style.css     # Stylesheet
│   └── views/
│       ├── layout.erb    # Main layout template
│       ├── index.erb     # Home page (list all gossips)
│       ├── new_gossip.erb # Form to create new gossip
│       ├── show.erb      # View single gossip details
│       └── edit.erb      # Form to edit existing gossip
```

## Routes

| Method | Route | Description |
|--------|-------|-------------|
| GET | `/` | Display all gossips |
| GET | `/gossips/new/` | Show form to create new gossip |
| POST | `/gossips/new/` | Create a new gossip |
| GET | `/gossips/:id` | View a specific gossip |
| GET | `/gossips/:id/edit` | Show form to edit a gossip |
| POST | `/gossips/:id/edit` | Update a gossip |
| POST | `/gossips/:id/delete` | Delete a gossip |

## Usage

1. **Create a Gossip**: Click the "New Gossip" button on the home page, fill in the author name and content, then submit.

2. **View a Gossip**: Click on any gossip in the list to see its full content.

3. **Edit a Gossip**: Click the "Edit" button on a gossip's detail page, modify the content, and save.

4. **Delete a Gossip**: Click the "Delete" button on a gossip's detail page to remove it.

## Data Storage

Gossips are stored in `db/gossip.csv` with the following format:
```
Author Name,Gossip Content
Author Name 2,Gossip Content 2
```

## Dependencies

- **sinatra**: Web framework for routing and views
- **rerun**: Auto-reload the server during development
- **csv**: Built-in Ruby library for CSV file handling
- **webrick**: Web server

## Development

To run the application with auto-reload on file changes:
```bash
bundle exec rerun 'rackup -p 4567'
```

## Notes

- This is a lightweight educational project suitable for learning Sinatra basics
- No database is used; data is persisted in a simple CSV file
- Each gossip is uniquely identified by its row index in the CSV file

## License

This project is part of the Full Stack Developer program at The Hacking Project.
