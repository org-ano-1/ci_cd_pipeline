pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                dir('app') {
                    sh 'npm install'
                }
            }
        }

        stage('Test') {
            steps {
                dir('app') {
                    sh 'npm test'
                }
            }
        }

        stage('Package') {
            steps {
                sh 'docker build -t ci-cd-demo .'
            }
        }

        stage('Deploy') {
            steps {
                sh 'docker-compose up -d'
            }
        }

        stage('Health-Check') {
            steps {
                sh './healthcheck.sh'
            }
        }
    }
}