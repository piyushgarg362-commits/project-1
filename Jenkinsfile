```groovy
pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                echo '=== CHECKOUT: Getting source code from Git ==='
                checkout scm
                echo '=== CHECKOUT: SUCCESS ==='
            }
        }

        stage('Maven Test') {
            steps {
                echo '=== TEST: Running Maven tests ==='
                sh 'mvn clean test'
                echo '=== TEST: SUCCESS ==='
            }
        }

        stage('Maven Package') {
            steps {
                echo '=== PACKAGE: Creating JAR file ==='
                sh 'mvn package -DskipTests'
                echo '=== PACKAGE: SUCCESS ==='

                echo '=== Generated files ==='
                sh 'ls -lh target/'
            }
        }

        stage('Docker Build') {
            steps {
                echo '=== DOCKER: Building Docker image ==='
                sh 'docker build -t devops-project:1.0 .'
                echo '=== DOCKER BUILD: SUCCESS ==='

                echo '=== Docker images ==='
                sh 'docker images | grep devops-project || true'
            }
        }
    }

    post {
        success {
            echo '======================================'
            echo 'PIPELINE SUCCESSFUL!'
            echo '======================================'
        }

        failure {
            echo '======================================'
            echo 'PIPELINE FAILED!'
            echo 'Check the failed stage above.'
            echo '======================================'
        }

        always {
            echo '=== Jenkins pipeline execution finished ==='
        }
    }
}
```
