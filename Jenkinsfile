pipeline {
    agent any

    

    environment {
        VENV_DIR = '.venv'
        RESULTS_DIR = 'results'
    }

    stages {
        stage('Checkout Code From Git') {
            steps {
                checkout scm
            }
        }

        stage('Install Dependencies') {
            steps {
                bat 'python -m venv %VENV_DIR%'
                bat '%VENV_DIR%\\Scripts\\python -m pip install --upgrade pip'
                bat '%VENV_DIR%\\Scripts\\pip install -r requirements.txt'
            }
        }

        stage('Run Test Automate') {
            steps {
                bat '%VENV_DIR%\\Scripts\\python python\\duplicate_items.py'
                bat '%VENV_DIR%\\Scripts\\python python\\simple_cipher.py'
                bat '%VENV_DIR%\\Scripts\\robot -d %RESULTS_DIR%\\web robot\\web_login_tests.robot'
                bat '%VENV_DIR%\\Scripts\\robot -d %RESULTS_DIR%\\api robot\\api_reqres_tests.robot'
                bat '''
                if exist app\\minimal-todo.apk (
                    %VENV_DIR%\\Scripts\\robot -d %RESULTS_DIR%\\mobile -v APP_PATH:%WORKSPACE%\\app\\minimal-todo.apk robot\\mobile_minimal_todo_tests.robot
                ) else (
                    echo Minimal-Todo APK not found. Skipping mobile execution.
                )
                '''
            }
        }

        stage('Send Result To Jenkins') {
            steps {
                archiveArtifacts artifacts: 'results/**/*.xml,results/**/*.html,results/**/*.png', allowEmptyArchive: true
                robot outputPath: 'results', passThreshold: 100, unstableThreshold: 90
            }
        }
    }

    post {
        always {
            junit testResults: 'results/**/*.xml', allowEmptyResults: true
        }
    }
}
