# CI/CD Demo Pipeline

This project demonstrates a complete CI/CD pipeline for a simple Node.js Express application using Jenkins and Docker.

## Project Structure

```
ci-cd-demo/
├── app/
│   ├── server.js
│   ├── package.json
│   └── test/
│       └── test.js
├── Dockerfile
├── docker-compose.yml
├── Jenkinsfile
├── healthcheck.sh
└── README.md
```

## Application

The demo app is a simple Express.js server that:

- Serves "Hello World" on the root path `/`
- Provides a health check endpoint `/health` returning `{"status": "healthy"}`

## Local Development

1. Navigate to the `app` directory
2. Install dependencies: `npm install`
3. Run tests: `npm test`
4. Start the app: `npm start`

## Docker Deployment

1. Build the Docker image: `docker build -t ci-cd-demo .`
2. Run with Docker Compose: `docker-compose up -d`
3. Access the app at `http://localhost:3000`
4. Check health: `curl http://localhost:3000/health`

## Jenkins Pipeline

The `Jenkinsfile` defines a Declarative pipeline with the following stages:

- **Build**: Install npm dependencies
- **Test**: Run unit tests
- **Package**: Build Docker image
- **Deploy**: Deploy using Docker Compose
- **Health-Check**: Verify the application is healthy

To run the pipeline in Jenkins:

1. Create a new pipeline job
2. Point to this repository
3. The pipeline will execute automatically

## Health Check Script

`healthcheck.sh` performs health checks by calling the `/health` endpoint and verifying the response. It retries up to 10 times with 5-second intervals.

## Requirements

- Node.js
- Docker
- Docker Compose
- Jenkins (for pipeline execution)
