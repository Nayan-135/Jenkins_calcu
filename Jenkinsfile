pipeline {
    agent any

    environment {
        // Name must match Jenkins → Manage Jenkins → Configure System → SonarQube
        SONARQUBE_SERVER = 'SonarQube-Server'
    }

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Setup Python Environment') {
            steps {
                sh '''
                python3 -m venv venv
                . venv/bin/activate
                pip install --upgrade pip
                pip install -r requirements.txt
                pip install pytest pytest-cov sonar-scanner
                '''
            }
        }

        stage('Run Tests & Coverage') {
            steps {
                sh '''
                . venv/bin/activate
                python -m pytest --cov=app --cov-report=xml tests/
                '''
            }
        }

        stage('SonarQube Analysis') {
            steps {
                withSonarQubeEnv("${SONARQUBE_SERVER}") {
                    sh '''
                    . venv/bin/activate
                    sonar-scanner \
                      -Dsonar.projectKey=jenkins_calculator \
                      -Dsonar.projectName=Jenkins_Calculator \
                      -Dsonar.projectVersion=1.0 \
                      -Dsonar.sources=. \
                      -Dsonar.language=py \
                      -Dsonar.python.coverage.reportPaths=coverage.xml \
                      -Dsonar.sourceEncoding=UTF-8
                    '''
                }
            }
        }
    }

    post {
        always {
            cleanWs()
        }
    }
}
