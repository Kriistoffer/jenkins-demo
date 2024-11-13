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

                    echo "${vulnerabilities.projects.size()}"

                    echo "${vulnerabilities.projects[0].frameworks.transitivePackages[0].size()}"

                    // for (int i = 0; i < vulnerabilities.projects.size(); i++) {
                    //     echo "${i}"

                    //     for (int j = 0; j < vulnerabilities.projects[i].frameworks.transitivePackages[j].size(); j++) {
                    //         echo "Antal transitiva sårbarheter: ${j + 1}"
                    //     }
                    // }
                }
            }
        }
    }
}