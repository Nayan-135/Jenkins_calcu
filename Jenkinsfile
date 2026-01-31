pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                // Pull code from the configured repository
                checkout scm
            }
        }

        stage('Install Dependencies') {
            steps {
                // Windows agent uses 'bat'
                bat 'pip install -r requirements.txt'
            }
        }

        stage('Run Tests & Coverage') {
            steps {
                // python -m avoids module path issues
                bat 'python -m pytest --cov=app --cov-report=xml tests/'
            }
        }
    }

    post {
        always {
            // Clean workspace after pipeline execution
            cleanWs()
        }
    }
}
