pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'pip install -r requirements.txt'
            }
        }

        stage('Run Tests & Coverage') {
            steps {
                sh 'python -m pytest --cov=app --cov-report=xml tests/'
            }
        }
    }

    post {
        always {
            cleanWs()
        }
    }
}
