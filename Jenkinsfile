#!/usr/bin/env groovy

pipeline {
    // parameters {
    //     choice(
    //         name: 'DEPLOY',
    //         choices: ["gh-page","aws"],
    //         description: "Ambiente de despliegue")
    // }
    agent any
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Build') {
            steps {
                sh 'make install'
                sh 'make project_workspace'
            }
        }
        stage('Test') {
            steps {
                sh 'make start'
            }
        }
        stage('Deploy') {
            steps {
                sh 'make release'
                sh 'make deploy.ghpages'
            }
        }
    }
}