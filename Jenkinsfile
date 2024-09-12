pipeline {
   agent any
    // triggers {
    //     pollSCM '* H/5 * * *'
    // }
    tools {
        nodejs "nodejs"
    }
    stages {
        stage('NPM') {
            steps {
                echo "Installing npm.."
                sh 'npm install'
            }
        }
        // stage('Check if needed directory exists') {
        //     steps {
        //         script {
        //             if (fileExists('dependency_check/npm')) {
        //                 echo "Directory exists in current workspace."
        //             } else {
        //                 sh 'mkdir -p /dependency_check/npm/'
        //                 echo "Directory created."
        //             }
        //         }
        //     }
        // }
        stage('NPM Audit') {
            steps {
                echo 'Running npm audit....'
                sh 'npm audit --json > npm_audit.json || true' 
            }
        }

        stage('Test') {
            steps {
                sh 'npm audit --json > npm_audit.json || true'
            }
        }

        stage('Handling the result') {
            steps {
                script {
                    def result = readJSON(file: "./npm_audit.json")
                    echo "Number of vulnerabilities found: ${result.metadata}"
                }
            }
        }
    }
}