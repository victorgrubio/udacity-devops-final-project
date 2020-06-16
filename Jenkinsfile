pipeline {
    agent {
      docker { image 'python:3.6.10-slim-stretch'}
    }
    stages {
        stage('Build'){
            steps{
              withEnv(["HOME=${env.WORKSPACE}"]) {
                sh 'pip3 install  --user pylint flask'
              }
            }
        }
        stage('Lint'){
          steps{
            withEnv(["HOME=${env.WORKSPACE}"]) {
                sh 'python3 -m pylint app.py'
              }
          }
        }
        stage('Build docker'){
          agent any
          steps{
            sh 'hadolint Dockerfile && ./bin/update_docker.sh'
          }
        }
    }
}