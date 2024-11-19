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
                    def outdated = readJSON(file: "./dotnet_outdated.json")
                    def vuln_toplevel = 0
                    def vuln_transitive = 0
                    def outdated_toplevel = 0
                    def outdated_transitive = 0

                    for(int i = 0; i < vulnerabilities.projects.size(); i++) {
                        if (vulnerabilities.projects[i].frameworks != null) {
                            if (vulnerabilities.projects[i].frameworks[0].topLevelPackages != null) {
                                for(int j = 0; j < vulnerabilities.projects[i].frameworks[0].topLevelPackages.size(); j++) {
                                    vuln_toplevel++
                                }
                            }
                        }
                    }

                    for(int i = 0; i < vulnerabilities.projects.size(); i++) {
                        if (vulnerabilities.projects[i].frameworks != null) {
                            if (vulnerabilities.projects[i].frameworks[0].transitivePackages != null) {
                                for(int j = 0; j < vulnerabilities.projects[i].frameworks[0].transitivePackages.size(); j++) {
                                    vuln_transitive++
                                }
                            }
                        }
                    }

                    for(int i = 0; i < outdated.projects.size(); i++) {
                        echo "i har värdet: ${i}"
                    }





                    echo "Number of top level found: ${vuln_toplevel}"
                    echo "Number of transitive found: ${vuln_transitive}"
                }
            }
        }
    }
}