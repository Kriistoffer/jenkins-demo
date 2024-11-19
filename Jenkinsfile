pipeline {
   agent any
    tools {
        nodejs "nodejs"
    }
    stages {
        stage("Räkna sårbarheter") {
            steps {
                script {
                    def vulnerabilities = readJSON(file: "./dotnet_vulnerabilities.json")
                    def number_of_transitive = 0
                    def number_of_toplevel = 0

                    for(int i = 0; i < vulnerabilities.projects.size(); i++) {
                        if (vulnerabilities.projects[i].frameworks != null) {
                            if (vulnerabilities.projects[i].frameworks[0].topLevelPackages != null) {
                                for(int j = 0; j < vulnerabilities.projects[i].frameworks[0].topLevelPackages.size(); j++) {
                                    number_of_toplevel++
                                }
                            }
                        }
                    }

                    for(int i = 0; i < vulnerabilities.projects.size(); i++) {
                        if (vulnerabilities.projects[i].frameworks != null) {
                            if (vulnerabilities.projects[i].frameworks[0].transitivePackages != null) {
                                for(int j = 0; j < vulnerabilities.projects[i].frameworks[0].transitivePackages.size(); j++) {
                                    number_of_transitive++
                                }
                            }
                        }
                    }

                    echo "Number of top level found: ${number_of_toplevel}"
                    echo "Number of transitive found: ${number_of_transitive}"
                    // echo "${vulnerabilities.projects[0].frameworks[0].transitivePackages[0].vulnerabilities.size()}"
                }
            }
        }
    }
}