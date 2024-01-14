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
                ansiblePlaybook credentialsId: 'git_s3836605', disableHostKeyChecking: true, installation: 'Ansible', inventory: 'COSC2767-RMIT-Store/utilities/aws/CloudFormation/ansible/dev.inv', playbook: 'COSC2767-RMIT-Store/utilities/aws/CloudFormation/ansible/ansiblePlaybook.yml', vaultTmpPath: ''
            }
        }

    }
}