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
                withcredentials([credentialsId: 'vairav1112', url: 'https://gcr.io']) {
                    // Tag the image for GCR
                    sh "docker tag gcr.io/${PROJECT_ID}/${IMAGE_NAME}:${TAG} gcr.io/${PROJECT_ID}/${IMAGE_NAME}:${TAG}"

                    // Push the image to GCR
                    sh "docker push gcr.io/${PROJECT_ID}/${IMAGE_NAME}:${TAG}"
                }
            }
        }
    }
}
