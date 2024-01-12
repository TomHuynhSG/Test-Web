pipeline {
    agent any

    triggers {
        pollSCM('* * * * *')
    }

    stages {

        stage('Cloning simple website code from Github') {
            steps {

                checkout scmGit(branches: [[name: '*/dang-branch']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/RMIT-DevOps-Hackathon/COSC2767-RMIT-Store.git']])
            }
        }

        stage ("Ansible"){
            steps {

            }
        }

    }
}