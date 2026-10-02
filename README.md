# DevOps Capstone Project

A complete DevOps pipeline — Node.js API containerized with Docker, deployed to AWS EC2 automatically via GitHub Actions and Terraform on every git push.

## Pipeline

git push → check code → build & push Docker image → Terraform provisions AWS → app live on EC2


## Stack

| Layer | Tool |
|-------|------|
| App | Node.js + Express |
| Container | Docker |
| CI/CD | GitHub Actions |
| Infrastructure | Terraform |
| Cloud | AWS (EC2, VPC, S3) |

## API

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | / | API status |
| GET | /health | Health check |
| GET | /items | Get all items |
| POST | /items | Add item |

## Run Locally

```bash
docker-compose up --build
curl http://localhost:3000/health
```

## Required GitHub Secrets

DOCKER_USERNAME
DOCKER_PASSWORD
AWS_ACCESS_KEY_ID
AWS_SECRET_ACCESS_KEY


## Infrastructure

Terraform creates VPC, subnets, internet gateway, security group and EC2 instance. State stored remotely in S3.

## Skills

Docker · GitHub Actions · Terraform · AWS EC2 · VPC · IAM · S3