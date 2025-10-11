# Rails 8 Features Demo

A demonstration application showcasing the new features and capabilities introduced in Rails 8, including modern deployment options, the new Solid* suite, and updated frontend tooling.

## Overview

This project demonstrates a Rails 8 application built on the edge version (main branch) of Rails, featuring:

- **Rails 8.1.0.alpha** - Running the latest development version of Rails
- **Modern Asset Pipeline** with Propshaft
- **Hotwire Stack** (Turbo & Stimulus) for reactive frontend
- **ViewComponent** for component-based views
- **Solid* Suite** for self-contained infrastructure
- **Kamal Deployment** for containerized deployment
- **Thruster** for HTTP acceleration
- **SQLite-based** production setup

## Key Rails 8 Features Demonstrated

### 1. **Solid Queue** - Database-backed Job Queue
Rails 8 introduces Solid Queue as a database-backed Active Job adapter that eliminates the need for Redis or other external job queue systems.

- Configuration: `config/queue.yml`
- Supports multiple workers, custom polling intervals, and batch processing
- Production database: `storage/production_queue.sqlite3`

### 2. **Solid Cache** - Database-backed Caching
Solid Cache provides a database-backed cache store, replacing the need for Redis/Memcached for caching.

- Configuration: `config/cache.yml`
- Supports namespace isolation and size limits
- Production database: `storage/production_cache.sqlite3`

### 3. **Solid Cable** - Database-backed Action Cable
Solid Cable brings database-backed WebSocket connections for Action Cable, removing Redis dependency.

- Production database: `storage/production_cable.sqlite3`

### 4. **Kamal Deployment**
Built-in support for deploying Rails applications anywhere using Docker containers.

- Configuration: `config/deploy.yml`
- Zero-downtime deployments
- SSL support via Let's Encrypt
- Accessory services support (databases, Redis, etc.)

### 5. **Thruster** - HTTP Acceleration
Thruster provides HTTP caching, compression, and X-Sendfile acceleration to Puma.

- Enabled in production via Dockerfile
- Serves on port 80 by default

### 6. **Propshaft** - Modern Asset Pipeline
A simpler, more efficient asset pipeline for Rails 8.

- No Sprockets dependency
- Focuses on delivering modern JavaScript via import maps

### 7. **ViewComponent Integration**
Demonstrates component-based view architecture using ViewComponent.

- Example component: `app/components/example_component.rb`
- Test coverage: `test/components/example_component_test.rb`

### 8. **SQLite in Production**
Rails 8 embraces SQLite for production workloads with multiple databases:
- Primary database: `storage/production.sqlite3`
- Queue database: `storage/production_queue.sqlite3`
- Cache database: `storage/production_cache.sqlite3`
- Cable database: `storage/production_cable.sqlite3`

## Technology Stack

### Backend
- **Ruby**: 3.3.0
- **Rails**: 8.1.0.alpha (edge/main branch)
- **Database**: SQLite3 (2.1+)
- **Web Server**: Puma with Thruster

### Frontend
- **JavaScript**: Import Maps (no Node.js required)
- **CSS**: Standard CSS with asset pipeline
- **Framework**: Hotwire (Turbo + Stimulus)
- **Components**: ViewComponent

### Infrastructure
- **Job Processing**: Solid Queue (can run in Puma or separate process)
- **Caching**: Solid Cache
- **WebSockets**: Solid Cable
- **Deployment**: Kamal (Docker-based)
- **Container**: Docker with multi-stage builds

## Getting Started

### Prerequisites
- Ruby 3.3.0
- SQLite3 2.1+
- Docker (for deployment)

### Installation

1. Clone the repository:
```bash
git clone https://github.com/andrewmp1/rails8-features-demo.git
cd rails8-features-demo
```

2. Install dependencies:
```bash
bundle install
```

3. Setup database:
```bash
bin/rails db:setup
```

4. Start the development server:
```bash
bin/dev
```

The application will be available at `http://localhost:3000`

## Development

### Running Tests
```bash
bin/rails test
bin/rails test:system  # System tests with Capybara
```

### Code Quality
```bash
bin/rails rubocop        # Ruby style checking
bin/rails brakeman       # Security vulnerability scanning
```

### Database Management
```bash
bin/rails db:migrate     # Run migrations
bin/rails db:seed        # Load seed data
bin/rails db:reset       # Reset database
```

## Deployment

### Using Kamal (Recommended)

1. Configure your deployment servers in `config/deploy.yml`

2. Setup Kamal secrets:
```bash
kamal setup
```

3. Deploy:
```bash
kamal deploy
```

### Using Docker Manually

1. Build the image:
```bash
docker build -t rails8-features-demo .
```

2. Run the container:
```bash
docker run -d -p 80:80 \
  -e RAILS_MASTER_KEY=<your-master-key> \
  --name rails8-features-demo \
  rails8-features-demo
```

## Project Structure

```
.
├── app/
│   ├── components/          # ViewComponent components
│   ├── controllers/         # Application controllers
│   ├── javascript/          # Stimulus controllers
│   ├── models/             # ActiveRecord models
│   └── views/              # View templates
├── config/
│   ├── cache.yml           # Solid Cache configuration
│   ├── queue.yml           # Solid Queue configuration
│   ├── deploy.yml          # Kamal deployment config
│   └── recurring.yml       # Recurring jobs (commented examples)
├── db/
│   ├── schema.rb           # Main database schema
│   ├── cache_schema.rb     # Cache database schema
│   ├── queue_schema.rb     # Queue database schema
│   └── cable_schema.rb     # Cable database schema
├── Dockerfile              # Production container definition
└── README.md              # This file
```

## Configuration

### Environment Variables

- `RAILS_MASTER_KEY`: Secret key for credentials (required in production)
- `SOLID_QUEUE_IN_PUMA`: Run Solid Queue in Puma process (default: true in Kamal)
- `JOB_CONCURRENCY`: Number of Solid Queue worker processes (default: 1)
- `WEB_CONCURRENCY`: Number of Puma workers (default: 1)
- `RAILS_LOG_LEVEL`: Logging level (default: info)

### Job Queue Configuration

Edit `config/queue.yml` to customize:
- Polling intervals
- Batch sizes
- Worker threads and processes
- Queue names and priorities

### Recurring Jobs

Uncomment and configure examples in `config/recurring.yml` to add scheduled jobs.

## Features Walkthrough

### Home Page
The root path (`/`) displays a simple home view demonstrating:
- Basic Rails routing
- ERB templates
- ViewComponent integration with the `ExampleComponent`

### ViewComponent Example
`app/components/example_component.rb` shows:
- Component initialization with parameters
- Inline ERB templates
- Content block rendering
- Component testing

### Health Check
The `/up` endpoint provides a health check for monitoring:
- Returns 200 if application boots successfully
- Returns 500 if there are boot exceptions
- Useful for load balancers and uptime monitors

## Rails 8 Benefits Demonstrated

1. **Simplified Infrastructure**: No Redis, Memcached, or other external services needed
2. **Easy Deployment**: Docker + Kamal = deploy anywhere with zero downtime
3. **Modern Frontend**: Import maps eliminate Node.js for basic JavaScript needs
4. **Cost-Effective**: SQLite-based setup reduces hosting costs
5. **Developer Experience**: Fast setup, fewer dependencies, clearer conventions
6. **Production-Ready**: Thruster provides performance, Solid* provides reliability

## Contributing

This is a demonstration project showcasing Rails 8 features. Feel free to explore, learn, and adapt the patterns for your own projects.

## Resources

- [Rails 8.0 Release Notes](https://edgeguides.rubyonrails.org/8_0_release_notes.html)
- [Kamal Documentation](https://kamal-deploy.org)
- [Solid Queue](https://github.com/rails/solid_queue)
- [Solid Cache](https://github.com/rails/solid_cache)
- [Solid Cable](https://github.com/rails/solid_cable)
- [Thruster](https://github.com/basecamp/thruster)
- [ViewComponent](https://viewcomponent.org)
- [Hotwire](https://hotwired.dev)

## License

This project is available for educational and demonstration purposes.
