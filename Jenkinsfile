pipeline {
   agent { 
        node {
            label 'docker-agent-alpine'
            }
      }
    triggers {
        pollSCM '* * * * *'
    }
    stages {
        stage('NPM') {
            steps {
                echo "Installing npm.."
                sh 'npm install'
            }
        }
        stage('Check if needed directory exists') {
            steps {
                script {
                    if (fileExists('dependency_check/npm')) {
                        echo "Directory exists in current workspace."
                    } else {
                        sh 'mkdir -p /dependency_check/npm/'
                        echo "Directory created."
                    }
                }
            }
        }
        stage('Deliver') {
            steps {
                echo 'Deliver....'
                sh '''
                '''
            }
        }
    }
}