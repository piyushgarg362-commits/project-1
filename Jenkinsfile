```groovy
pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                echo '=== Checking out source code ==='
                checkout scm
                echo '=== Checkout completed ==='
            }
        }

        stage('Maven Test') {
            steps {
                echo '=== Running Maven tests ==='
                sh 'mvn clean test'
                echo '=== Maven tests completed successfully ==='
            }
        }

        stage('Maven Package') {
            steps {
                echo '=== Packaging application ==='
                sh 'mvn package -DskipTests'
                echo '=== Application packaged successfully ==='
            }
        }

        stage('Docker Build') {
            steps {
                echo '=== Building Docker image ==='
                sh 'docker build -t my-maven-app:1.0 .'
                echo '=== Docker image built successfully ==='
            }
        }
    }

    post {
        success {
            echo '========================================'
            echo 'PIPELINE COMPLETED SUCCESSFULLY'
            echo '========================================'
        }

        failure {
            echo '========================================'
            echo 'PIPELINE FAILED - CHECK THE CONSOLE LOG'
            echo '========================================'
        }

        always {
            echo '=== Pipeline execution finished ==='
        }
    }
}
```
