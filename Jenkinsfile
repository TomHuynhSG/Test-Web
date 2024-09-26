pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                script {
                    git branch: 'main', url: 'https://github.com/KhangLeonardo/COSC2767-RMIT-Store.git'
                }
            }
        }

        stage('Build') {
            steps {
                script {
                    sshPublisher(
                        publishers: [
                            sshPublisherDesc(
                                configName: 'Testing Server',
                                transfers: [
                                    sshTransfer(
                                        cleanRemote: false,
                                        excludes: '',
                                        execCommand: '',
                                        execTimeout: 120000,
                                        flatten: false,
                                        makeEmptyDirs: false,
                                        noDefaultExcludes: false,
                                        patternSeparator: '[, ]+',
                                        remoteDirectory: '',
                                        remoteDirectorySDF: false,
                                        removePrefix: '',
                                        sourceFiles: '**/*'
                                    )
                                ],
                                usePromotionTimestamp: false,
                                useWorkspaceInPromotion: false,
                                verbose: false
                            )
                        ]
                    )
                }
            }
        }

        stage('Test') {
            steps {
                script {
                    sshagent(credentials: ['testing-server-ssh-key']) {
                        sh """
                            ssh -o StrictHostKeyChecking=no -tt ec2-user@44.195.41.174 << EOF
                            sudo su
                            sh source-testing.sh
                            exit
                            exit
                        """
                    }
                }
            }
        }
    }
}
