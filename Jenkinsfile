pipeline {
    agent any

    stages {
        stage('LoadRepository') {
            steps {
                echo 'clone Git repository to workspace https://github.com/conan-io/hello'
                git branch: 'master', url:'https://github.com/conan-io/hello'
            }
        }
        stage('create conan environment') {
            steps {
                ws ('/home/HelloConan/python_virtualenv'){
                    //fileExists 'requirements.txt'
                    echo 'True'
                    sh label:'verify python interpter', script: "python --version"
                    sh label: 'install pip', script: "curl \"https://bootstrap.pypa.io/get-pip.py\" -o \"get-pip.py\";python get-pip.py"
                    sh "python -m pip --version"
                    sh "pip install conan"
                }
            }
        }
        stage('verify conan environment') {
            steps {
                echo 'verify conan env'
            }
        }
        stage('Build') {
            steps {
                echo 'Build project'
                sh "cmake ."
                sh "make"
            }
        }
        stage('UnitTests') {
            steps {
                echo 'runnig unit tests'
            }
        }
        stage('Pack') {
            steps {
                echo 'create artifacts'
            }
        }
        stage('SmokeTest') {
            steps {
                echo 'run smoke test on artifcts'
            }
        }
        stage('Deploy') {
            steps {
                echo 'deploy artifacts to repository'
            }
        }
    }
}
