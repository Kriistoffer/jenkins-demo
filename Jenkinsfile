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


                    for(int i = 0; i < vulnerabilities.projects[0].frameworks[0].transitivePackages.size(); i++) {
                        echo "i har nu värdet: ${i}"

                        for(int j = 0; j < vulnerabilities.projects[0].frameworks[0].transitivePackages[i].vulnerabilities.size(); j++) {
                            echo "j har nu värdet: ${j}"
                        }
                    }
                    // echo "${vulnerabilities.projects[0].frameworks[0].transitivePackages[0].vulnerabilities.size()}"
                }
            }
        }
    }
}