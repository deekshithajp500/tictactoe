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
                sh 'sudo apt install python3-pip'
                sh 'pip install numpy'
                sh 'python3 tictactoe.py'
            }
        }
    }
}
