#!/usr/bin/env groovy

pipeline {
    parameters {
        choice(
            name: 'DEPLOY',
            choices: ["gh-page","aws"],
            description: "Ambiente de despliegue")
    }
    agent any
    stages {
        stage('Build') {
            steps {
                sh 'make project-workspace'
                sh 'make install'
            }
        }
        stage('Test') {
            steps {
                sh 'make start'
                sh 'make curl'
            }
        }
        stage('Deploy') {
            steps {
                sh 'make release'
                if ("${DESIRED_COUNT}" == "aws") {
                    sh 'make deploy.aws'
                } else {
                    sh 'make deploy.ghpages'
                }
            }
        }
    }
}