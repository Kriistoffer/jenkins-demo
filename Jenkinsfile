pipeline {
   agent any
    tools {
        nodejs "nodejs"
    }
    stages {
        stage("Räkna sårbarheter") {
            steps {
                script {
                    def vulnerabilities = readJSON(file: "./buh_dotnet_vulnerabilities.json")

                    echo "${vulnerabilities.projects[0].frameworks[0].transitivePackages[0]}"
                }
            }
        }
    }
}