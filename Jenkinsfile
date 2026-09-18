pipeline {

    agent any

    stages {

        stage('Checkout') {
            steps {
                echo 'Checking out source code...'
                checkout scm
            }
        }

        stage('Build') {
            steps {
                echo 'Building application with Maven...'
                sh 'mvn clean package'
            }
        }

        stage('Test') {
            steps {
                echo 'Running tests...'
                sh 'mvn test'
            }
        }

        stage('Docker Build') {
            steps {
                echo 'Building Docker image...'
                sh 'docker build -t devops-project:1.0 .'
            }
        }

        stage('Docker Run') {
            steps {
                echo 'Running Docker container...'

                sh '''
                    docker rm -f devops-project-container || true

                    docker run \
                        --name devops-project-container \
                        devops-project:1.0
                '''
            }
        }
    }

    post {

        success {
            echo '================================='
            echo 'Pipeline completed successfully!'
            echo '================================='
        }

        failure {
            echo '================================='
            echo 'Pipeline failed!'
            echo '================================='
        }
    }
}
