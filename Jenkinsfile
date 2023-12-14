pipeline {
    agent any
    
    environment {
        PROJECT_ID = 'your-project-id'
        IMAGE_NAME = 'vmapp'
        TAG = '1.0'
    }
    
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/Vairavmoorthy/E-commerce-project-springBoot.git'
            }
        }
        
        stage('Build') {
            steps {
                sh 'cd JtProject && mvn clean package'
            }
        }
        
        stage('Build Docker Image') {
            steps {
                sh "docker build -t gcr.io/${PROJECT_ID}/${IMAGE_NAME}:${TAG} ."
            }
        }
        
        stage('Push to GCR') {
            steps {
                withCredentials([file(credentialsId: "${PROJECT}_artifacts", variable: '$GCR_KEY')]) {
                    sh "docker push gcr.io/${PROJECT_ID}/${IMAGE_NAME}:${TAG}"
                }
            }
        }
    }
}
