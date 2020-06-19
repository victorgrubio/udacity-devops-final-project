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
          docker.withRegistry( '', registryCredential) {
            dockerImage = docker.build registry + ":1.0.0"
            dockerImage.push()
          }
        }
      }
    }
    stage('Validate CloudFormation Template'){
      steps{
        withAWS(region:'us-east-1', credentials:'9aee3fa1-090b-4274-a588-17d54bad0cf5') {
          def response_network = cfnValidate(file:'cloud-formation/network.yaml')
          echo "template description: ${response_network.description}"
          def response_servers = cfnValidate(file:'cloud-formation/servers.yaml')
          echo "template description: ${response_servers.description}"
        }
      }
    }
    stage('Create CloudFormation Stacks'){
      steps{
        withAWS(region:'us-east-1', credentials:'9aee3fa1-090b-4274-a588-17d54bad0cf5') {
          def output_network_stack = cfnUpdate(stack:'final-project-network', file:'cloud-formation/network.yml', timeoutInMinutes:30, pollInterval: 15000)
          def output_network_stack = cfnUpdate(stack:'final-project-servers', file:'cloud-formation/servers.yml', paramsFile:'cloud-formation/server-parameters.json', timeoutInMinutes:30, pollInterval:30000)
          def outputs = cfnDescribe(stack:'final-project-servers')
          echo "Server stack description: ${outputs}"
        }
      }
    }
  }
}