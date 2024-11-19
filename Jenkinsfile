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
                    int vuln_toplevel = 0
                    int vuln_transitive = 0
                    int outdated_toplevel = 0
                    int outdated_transitive = 0

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
                        if (outdated.projects[i].frameworks != null) {
                            if (outdated.projects[i].frameworks[0].topLevelPackages != null) {
                                for(int j = 0; j < outdated.projects[i].frameworks[0].topLevelPackages.size(); j++)
                                    outdated_toplevel++
                            }
                        }
                    }
                    for(int i = 0; i < outdated.projects.size(); i++) {
                        if (outdated.projects[i].frameworks != null) {
                            if (outdated.projects[i].frameworks[0].transitivePackages != null) {
                                for(int j = 0; j < outdated.projects[i].frameworks[0].transitivePackages.size(); j++)
                                    outdated_transitive++
                            }
                        }
                    }

                    echo "Number of top level found: ${vuln_toplevel}"
                    echo "Number of transitive found: ${vuln_transitive}"

                    echo "Number of outdated top level found: ${outdated_toplevel}"
                    echo "Number of outdated transitive found: ${outdated_transitive}"

                    int total = outdated_transitive + outdated_toplevel
                    slackSend(channel: "#team1-dependency_check", message: "${outdated_toplevel + outdated_transitive} utdaterade paket hittade (${outdated_toplevel} top-level och ${outdated_transitive} transitiva.)")
                }
            }
        }
    }
}