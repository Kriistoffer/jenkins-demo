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
                    def number_of_transitive = 0

                    for(int i = 0; i < vulnerabilities.projects.size()) {
                        echo "i har nu värdet: ${i}"
                    }
                    for(int j = 0; j < vulnerabilities.projects[0].frameworks[0].transitivePackages.size(); j++) {
                        echo "j har nu värdet: ${j}"
                        number_of_transitive++
                    }


                    echo "Number of vuln found: ${number_of_transitive}"
                    // echo "${vulnerabilities.projects[0].frameworks[0].transitivePackages[0].vulnerabilities.size()}"
                }
            }
        }
    }
}