pipeline {
    agent any
    environment {
        DOCKER_IMAGE_NAME = "sunnynehar56/degree53"
    }
    stages {
        stage('Checkout Source') {
            steps {
              git 'https://github.com/sunnynehar56/cicd.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    app = docker.build(DOCKER_IMAGE_NAME)
                    app.inside {
                        sh 'echo Hello, from docker!'
                    }
                }
            }
        }
        stage('Push Docker Image') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'docker_hub_login') {
                        app.push("${env.BUILD_NUMBER}")
                        app.push("latest")
                    }
                }
            }
        }
        stage('DeployToProduction') {
            steps {
                input 'Deploy to Production?'
                milestone(1)
                kubernetesDeploy(
                    kubeconfigId: 'kubeconfig',
                    configs: 'staticweb.yaml',
                    enableConfigSubstitution: true
                )
            }
        }
    }
}
