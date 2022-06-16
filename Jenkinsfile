pipeline {
    agent any
    environment {
        PATH = "/usr/local/bin:${env.PATH}"
    }
    stages {
        stage('Git Checkout') {
            steps {
                git branch: 'main', credentialsId: 'github_key', url: 'https://github.com/jagadeeshbm3/solution.git'
            }
        }
        stage('Generate inputfile') {
            steps {
                rm '/Users/jmokshar/solution/inputFile'
                sh '/Users/jmokshar/solution/gencsv.sh'
            }
        }
        stage('solution') {
            steps {
                echo "PATH is: ${env.PATH}"
                sh '/usr/local/bin/docker-compose up -d'
            }
        }
    }
}

