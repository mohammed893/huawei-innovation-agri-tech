# Docker Setup

## Overview
This folder contains Dockerfiles and the `docker-compose.yml` file to containerize and orchestrate the multi-stack app.

### Services
1. **Flask Backend**
   - Dockerfile: `flask.Dockerfile`
   - Runs on port `5000`.

2. **Node.js Backend**
   - Dockerfile: `nodejs.Dockerfile`
   - Runs on port `4000`.
3. **PostgreSQL Database**
   - Image: `postgres:13`
   - Runs on port `5432`.

### How to Use

#### Build and Start All Services
1. Navigate to the `docker/` folder:
   ```bash
   cd docker