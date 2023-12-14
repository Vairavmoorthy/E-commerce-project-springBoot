pipeline {
    agent any
    environment {
        PROJECT_ID = 'xenon-chain-407805'
        IMAGE_NAME = 'vmapp'
        TAG = '1.0'
        GCR_CREDENTIALS = credentials('vairav1112')
        PATH = "/opt/apache-maven-3.9.6/bin:$PATH"
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
                script {
                    withCredentials([file(credentialsId: "${vairav1112}", variable: 'GCR_KEY')]) {
                        sh "gcloud auth activate-service-account --key-file=$GCR_KEY"
                        sh "gcloud auth configure-docker"
                        sh "docker push gcr.io/${PROJECT_ID}/${IMAGE_NAME}:${TAG}"
                    }
                }
            }
        }
    }
}
