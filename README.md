# Caddy, PHP, MySQL, and phpMyAdmin Docker Stack

This repository provides a Docker-based stack with Caddy as the web server, PHP for backend processing, MySQL for the database, and phpMyAdmin for database management.

## Prerequisites

Before you start, make sure you have the following installed on your system:
- Docker
- Docker Compose

## Services Overview

- PHP: PHP 8.1-FPM is used for backend processing.
- MySQL: MySQL 8.0 serves as the database.
- Caddy: Caddy is used as the web server to serve static files and handle PHP requests.
- phpMyAdmin: phpMyAdmin is included for easy database management.

## Directory Structure

.
├── Dockerfile               # Docker configuration for PHP service
├── Caddyfile                # Configuration for Caddy server
├── docker-compose.yml       # Docker Compose configuration
├── public/                  # Public directory where the website is served from
│   └── index.php            # Example PHP file
└── README.md                # This file

## Installation and Setup

1. Clone this repository:
   git clone https://github.com/vovka93/caddy-php-mysql-stack.git
   cd caddy-php-mysql-stack

2. Make sure you have the required files (Dockerfile, Caddyfile, and docker-compose.yml) in the project directory.

3. Build and start the services:
   docker-compose up -d

4. Check if all containers are running:
   docker-compose ps

5. Access the services:
   - PHP application: Go to http://localhost in your browser.
   - phpMyAdmin: Go to http://localhost:8080 and log in using the following credentials:
     - Username: root
     - Password: rootpassword (as defined in docker-compose.yml)

## Managing Containers

- To stop the containers:
  docker-compose down

- To restart the containers after changes:
  docker-compose up -d

- To view logs for a specific service (e.g., PHP):
  docker-compose logs php

## Customization

### Environment Variables

You can modify the MySQL environment variables in the docker-compose.yml file to use different database credentials:

environment:
  MYSQL_ROOT_PASSWORD: rootpassword
  MYSQL_DATABASE: mydatabase
  MYSQL_USER: user
  MYSQL_PASSWORD: password

### Adding PHP Extensions

To install additional PHP extensions, modify the Dockerfile:

RUN apt-get update && apt-get install -y \
    <extension-dependencies> \
    && docker-php-ext-install <php-extensions>

### Caddy Configuration

Modify the Caddyfile for custom routing or SSL configuration. Example:

:80 {
    root * /var/www/html/public
    php_fastcgi php:9000
    file_server
}

## Troubleshooting

- Database connection errors: Ensure the MySQL credentials are correctly set and the MySQL service is running:
  docker-compose ps

- Port conflicts: Make sure the ports 80, 443, and 8080 are not being used by other applications on your host machine.

- View container logs: Check logs of the failing container for errors:
  docker-compose logs <service-name>

## License

This project is open-source and available under the MIT License.

Enjoy building with Docker, Caddy, PHP, MySQL, and phpMyAdmin!
