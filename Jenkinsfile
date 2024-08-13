pipeline {
  agent any
  stages {
    stage("Build") {
      steps {
        git url: 'https://github.com/malli-source/-jenkins-maven-project.git'
        withMaven {
          sh "mvn clean verify -f hello-app/pom.xml"
        } // withMaven will discover the generated Maven artifacts, JUnit Surefire & FailSafe reports and FindBugs reports
      }
    }
  }
}
