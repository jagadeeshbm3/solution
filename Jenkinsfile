pipeline {
    agent any

    stages {
        stage('Git Checkout') {
            steps {
                git branch: 'main', credentialsId: 'github_key', url: 'https://github.com/jagadeeshbm3/solution.git'
            }
        }
        stage('Generate inputfile') {
            steps {
                sh '/Users/jmokshar/solution/gencsv.sh'
            }
        }
        stage('solution') {
            steps {
                sh 'cd /usr/local/bin'
                sh '/usr/local/bin/docker-compose up'
            }
        }
    }
}

