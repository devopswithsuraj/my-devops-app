pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'devops-node-app'
    }

    stages {
        stage('Clone') {
            steps {
                git branch: 'main', url: 'https://github.com/devopswithsuraj/my-devops-app.git'
            }
        }

        stage('Build Docker') {
            steps {
                script {
                    docker.build(env.DOCKER_IMAGE)
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    sh 'docker rm -f devops-app || true'
                    sh "docker run -d --name devops-app -p 80:80 ${DOCKER_IMAGE}"
                }
            }
        }
    }

    post {
        success {
            mail to: 'devopswithsuraj@gmail.com',
                subject: "✅ SUCCESS: ${env.JOB_NAME} [#${env.BUILD_NUMBER}]",
                body: "The deployment was successful.\n\nView it here: ${env.BUILD_URL}"
        }

        failure {
            mail to: 'devopswithsuraj@gmail.com',
                subject: "❌ FAILURE: ${env.JOB_NAME} [#${env.BUILD_NUMBER}]",
                body: "The build failed. Please check Jenkins console output.\n\n${env.BUILD_URL}"
        }
    }
}
