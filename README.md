# Library Management System

Library Management System (LMS) - Containerized using Docker And Deployed on Kubernetes(minikube)

## Docker Implementation

Created a multi-container application using Docker and Docker Compose to orchestrate Flask and MySQL services. Built a custom Docker image for the Flask application with Python 3.9-slim base, installing all required dependencies including MySQL client libraries and cryptography package for secure database authentication.

## Docker Compose Orchestration

Configured docker-compose.yaml to manage two services: flask-app and mysql-db. Implemented service discovery where Flask connects to MySQL using Docker's internal DNS (mysql hostname). Added persistent volumes for MySQL data storage and initialization scripts to pre-populate the database with sample book records.

## Kubernetes Deployment

Transitioned to Kubernetes for production-grade orchestration with multiple resource manifests:
## Pod Configuration

Created a single Pod containing both Flask and MySQL containers sharing network namespace, enabling communication via localhost. Added readiness checks and initialization wait logic to ensure database availability before Flask starts.

## Service Exposure

Deployed Service resources with NodePort type (port 30080) to expose the Flask application externally, enabling access from outside the Kubernetes cluster while maintaining internal service discovery.

## Deployment & ReplicaSet

Implemented Deployment controllers for declarative updates and self-healing capabilities. Configured ReplicaSet to maintain desired pod replicas, ensuring high availability and scalability of the Flask application.

## Configuration Management

Utilized ConfigMap to externalize application configuration, separating environment-specific settings from application code. This includes database connection strings, feature flags, and other runtime parameters.

## Persistent Storage

Configured PersistentVolumeClaims for MySQL data persistence, ensuring database state survives pod restarts and rescheduling across cluster nodes.


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
