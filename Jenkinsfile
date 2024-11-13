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

                    for (int i = 0; i < vulnerabilities.projects.size(); i++) {
                        echo "${i}"

                        for (int j = 0; j < vulnerabilities.projects[i].frameworks.size(); j++) {
                            echo "${j}"
                        }
                    }
                }
            }
        }
    }
}