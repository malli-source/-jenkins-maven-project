pipeline {
    agent any
    tools {
        maven 'maven3'
        jdk 'jdk17'
    }
    // environment {
    //     PATH = "/opt/apache-maven-3.9.8/bin:$PATH"
    // }
    stages {
        stage('Build') {
            steps {
                sh 'mvn --version'
                sh 'mvn -f hello-app/pom.xml -B -DskipTests clean package'
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
                sh 'mvn test -f hello-app/pom.xml'
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
                 sh 'mvn -f hello-app/pom.xml clean package sonar:sonar -Dsonar.projectKey=new-pipeline -Dsonar.projectName=new-pipeline'
             }
             }
           }
        }
    }
}
