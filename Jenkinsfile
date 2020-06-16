pipeline {
    environment {
      registry = "victorgrubio/udacity-devops-final-project"
      registryCredential = 'dockerhub'
      dockerImage = ''
    }
    agent any
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
          steps{
            withEnv(["HOME=${env.WORKSPACE}"]) {
                sh 'hadolint Dockerfile && chmod +x bin/update_docker.sh && sh bin/update_docker.sh'
              }
          }
        }
    }
}