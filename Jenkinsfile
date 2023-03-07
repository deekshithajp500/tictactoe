#!/usr/bin/env groovy

pipeline {

    agent {
        docker {
            image 'node'
            args '-u root'
        }
    }

    stages {
        stage('Build') {
            steps {
                echo 'Building...'
                sh 'npm install'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing...'
                sh 'npm test'
            }
        }
        stage('python') {
            steps {
                echo 'tictactoe output'
                sh 'python3 -c "import numpy"'
                sh 'python3 tictactoe.py'
            }
        }
    }
}
