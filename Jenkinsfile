pipeline {
    agent any
    environment {
        // Esto le dice al cliente que use una versión de API que sí entienda
        DOCKER_API_VERSION = '1.44' 
    }

    tools {
        nodejs "Node25"
        dockerTool "Dockertool" 
    }

    stages {
        stage('Instalar dependencias') {
            steps {
                sh 'npm install'
            }
        }

        stage('Construir Imagen Docker') {
            when {
                expression { currentBuild.result == null || currentBuild.result == 'SUCCESS' }
            }
            steps {
                sh 'docker build -t hola-mundo-node:latest .'
            }
        }

            stage('Ejecutar tests') {
            steps {
                sh 'chmod +x ./node_modules/.bin/jest'  // Soluciona el problema de permisos
                sh 'npm test -- --ci --runInBand'
            }
        }
    }
}