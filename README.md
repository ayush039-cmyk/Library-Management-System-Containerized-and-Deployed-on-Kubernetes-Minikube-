# Library Management System

Library Management System (LMS) - Containerized using Docker And Deployed on Kubernetes(minikube)

# Docker Implementation

The Flask application is containerized using a custom Docker image built on the lightweight python:3.9-slim base image.

## Key highlights:

Installed all required Python dependencies via requirements.txt

Included MySQL client libraries and cryptography for secure database authentication

Configured environment variables for runtime flexibility

Used a clean, minimal image for faster builds and reduced attack surface

This approach ensures consistent runtime behavior across development and production environments.

# Docker Compose Orchestration

Docker Compose is used to orchestrate a multi-container setup consisting of:

Flask application service

MySQL database service

## Key features:

Service-to-service communication using Docker’s internal DNS (MySQL accessible via hostname mysql)

Persistent MySQL storage using Docker volumes

Automatic database initialization using SQL scripts mounted into /docker-entrypoint-initdb.d

Clear separation of application and database concerns

This setup enables seamless local development and mirrors real-world microservice architectures.

# Kubernetes Deployment

The application is migrated to Kubernetes to demonstrate production-grade orchestration and scalability.

## Pod Configuration

Deployed Flask and MySQL containers within a single Pod to share the network namespace

Enabled communication via localhost

Implemented startup ordering logic to ensure the database is available before Flask initializes

This approach simplifies internal networking while demonstrating container co-location patterns.

## Service Exposure

Exposed the Flask application using a NodePort Service

Configured external access on port 30080

Maintained internal cluster networking for secure service communication

This allows the application to be accessed from outside the Kubernetes cluster.

## Deployment & Scaling

Implemented Deployment controllers for declarative application management

Used ReplicaSets to maintain the desired number of pod replicas

Enabled self-healing, rolling updates, and scalability

This ensures high availability and fault tolerance in production environments.

## Configuration Management

Used ConfigMaps to externalize application configuration

Decoupled environment-specific values from application code

Managed database credentials, connection parameters, and runtime settings cleanly

This follows Kubernetes best practices for configuration management.

## Persistent Storage

Configured PersistentVolumeClaims (PVCs) for MySQL data

Ensured database state persists across pod restarts and rescheduling

Enabled reliable data durability within the Kubernetes cluster

# Key Features Implemented

    Service Discovery: Automatic DNS-based service resolution between containers

    Health Monitoring: Readiness and liveness probes for both services

    Data Persistence: Persistent volumes for MySQL database

    Scalability: Horizontal pod autoscaling configuration

    Secrets Management: Secure handling of database credentials

    Rolling Updates: Zero-downtime deployment strategy

# Commands:

 ## To build Dockerfile:
  docker build -f accountname/imagename .

## To push image:
  docker push accountname/imagename

## To run Docker-Compose:
  docker-compose up

 ## To deploy pods:
  kubectl create -f pod-definition.yaml

 ## To deploy services:
  kubectl create -f flask-service.yaml
  kubectl create -f mysql-service.yaml

 ## To deploy replicaset:
  kubectl create -f replicaset-service.yaml

 ## To deploy config-map:
  kubectl create -f config-map.yaml

 ## For deployment:
  kubectl create -f deployment-definition.yaml

## To get URL of running pods:
  minikube service <pods-name> --url
