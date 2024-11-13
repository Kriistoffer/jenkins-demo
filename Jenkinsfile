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

                    echo "${vulnerabilities.projects[i].frameworks[0].transitivePackages[j].vulnerabilities.size()}"
                    int i, j
                    for (i = 0; i < vulnerabilities.projects.size(); i++) {
                        echo "${vulnerabilities.projects[i].path}"

                        for (j = 0; j < vulnerabilities.projects[i].frameworks[0].transitivePackages[j].size(); j++) {
                            echo "${vulnerabilities.projects[i].frameworks[0].transitivePackages[j].id}"
                        }
                    }
                }
            }
        }
    }
}