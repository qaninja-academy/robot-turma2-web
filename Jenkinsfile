pipeline {
    agent { 
        docker { image "python" }
    }
    stages {
        stage("Build") {
            steps {
                sh "pip install -r requirements.txt"
            }
        }
        stage("Test") {
            steps {
                sh "robot -d ./logs tests"
            }
            post {
                always {
                    robot "logs"
                }
            }
        }
        stage("UAT") {
            steps {
                input(message: "Pode ir para prod?". ok: "Partiu")
                echo "simulando a subida em producao!!!! :)"
            }
        }
        stage("Prod") {
            steps {
                echo "Producao ok!"
            }
        }
    }
}