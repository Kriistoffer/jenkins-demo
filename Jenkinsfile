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
                    def number_of_vulnerabilities = 0


                    for(int i = 0; i < vulnerabilities.projects[0].frameworks[0].transitivePackages.size(); i++) {
                        echo "i har nu värdet: ${i}"
                        number_of_vulnerabilities++
                    }
                    echo "Number of vuln found: ${number_of_vulnerabilities}"
                    // echo "${vulnerabilities.projects[0].frameworks[0].transitivePackages[0].vulnerabilities.size()}"
                }
            }
        }
    }
}