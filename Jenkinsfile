pipeline {
    agent any
    environment {
        JAVA_HOME = "C:\Program files\Java\jdk-17"
    }
    stages {
        stage('Build') {
            steps {
                bat 'mvn -f hello-app/pom.xml -B -DskipTests clean package'
            }
            post {
                success {
                    echo "Now Archiving the Artifacts....."
                    archiveArtifacts artifacts: '**/*.jar'
                }
            }
        }
        stage('Test') {
            steps {
                bat 'mvn test -f hello-app/pom.xml'
            }
            post {
                always {
                    junit 'hello-app/target/surefire-reports/*.xml'
                }
            }
        }
    }
}
