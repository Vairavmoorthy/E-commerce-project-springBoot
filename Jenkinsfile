pipeline {
    agent any
    environment {
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
    }
}
