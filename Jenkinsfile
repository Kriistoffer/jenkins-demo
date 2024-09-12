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
        stage('Audit check') {
            steps {
                echo 'Running npm audit...'
                sh 'npm audit --json > npm_audit.json || true' 
            }
        }

        stage('Posting audit result') {
            steps {
                script {
                    def result = readJSON(file: "./npm_audit.json")
                    echo "Number of vulnerabilities found: ${result.metadata.vulnerabilities.total} (${result.metadata.vulnerabilities.critical} critical, ${result.metadata.vulnerabilities.high} high, ${result.metadata.vulnerabilities.moderate} moderate, ${result.metadata.vulnerabilities.low} low, and ${result.metadata.vulnerabilities.info} info)."
                    echo "Read the full report on ${BUILD_URL}"
                }
            }
        }

        stage('Version check') {
            steps {
                echo 'Running npm outdated...'
                sh 'npm outdated --json > npm_outdated.json || true'
            }
        }

        stage('Posting version check result') {
            steps {
                script {
                    def result = readJSON(file: "./npm_outdated.json")
                    // def result = readFile(file: "./npm_outdated.txt")
                    echo "${result}"
                }
            }
        }
    }
}