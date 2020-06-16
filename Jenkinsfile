pipeline {
    agent {
      docker { image 'python:3.6.10-slim-stretch'}
    }
    stages {
        stage('Build'){
            steps{
              withEnv(["HOME=${env.WORKSPACE}"]) {
                sh 'python3 -m venv venv && . venv/bin/activate && pip3 install --no-cache-dir --user pylint'
              }
            }
        }
        stage('Lint'){
          steps{
            
            sh '. venv/bin/activate \ 
                && pylint app.py \
                && wget https://github.com/hadolint/hadolint/releases/download/v1.18.0/hadolint-Linux-x86_64 hadolint \
                && mv hadolint /usr/bin \
                && hadolint Dockerfile'
          }
        }
        stage('Build docker'){
          steps{
            sh './bin/update_docker.sh'
          }
        }
    }
}