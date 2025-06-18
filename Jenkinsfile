pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'devops-node-app'
    }

    stages {
        stage('Clone') {
            steps {
                git 'https://github.com/devopswithsuraj/my-devops-app.git'
            }
        }

        stage('Build Docker') {
            steps {
                script {
                    dockerImage = docker.build("${DOCKER_IMAGE}")
                }
            }
        }

        stage('Deploy') {
            steps {
                sh 'docker rm -f devops-app || true'
                sh "docker run -d --name devops-app -p 80:80 ${DOCKER_IMAGE}"
            }
        }
    }

    post {
        failure {
            mail to: 'devopswithsuraj@gmail.com',
                 subject: "🚨 Jenkins Job Failed: ${env.JOB_NAME} [${env.BUILD_NUMBER}]",
                 body: "The Jenkins job has failed. Please check: ${env.BUILD_URL}"
        }
    }
}
