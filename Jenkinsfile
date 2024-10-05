pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                bat 'mvn --version'
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
        stage('Static Code Analysis') {
           steps {
             script {
               withSonarQubeEnv(credentialsId: 'sonar') {
                 bat 'mvn -f hello-app/pom.xml clean package sonar:sonar -Dsonar.projectKey=malli-sonar -Dsonar.projectName=malli-sonar'
             }
             }
           }
        }
    }
}
