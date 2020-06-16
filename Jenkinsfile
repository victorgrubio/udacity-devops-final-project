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
              sh 'hadolint Dockerfile'
            }
            script {
              docker.withRegistry( '', registryCredential ) {
                dockerImage = docker.build registry + ":1.0.0"
                dockerImage.push()
              }
            }
          }
        }
    }
}