#!/bin/bash
VERSION=1.0.2
docker build -t victorgrubio/udacity-devops-final-project:$VERSION .
docker push victorgrubio/udacity-devops-final-project:$VERSION
