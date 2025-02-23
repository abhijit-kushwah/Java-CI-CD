pipeline{
    agent any
    tools{
        maven 'maven_3_9_9'
    }
    stages{
        stage('Build Maven'){
            steps{
            checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/abhijit-kushwah/Java-CI-CD']])
            sh 'mvn clean install'
            }
        }
        stage('Build Docker Image'){
            steps{
                script{
                    sh 'docker build -t abhijitsingh20/java-ci-cd .'
                }
            }
        }
        stage('Push Image to Docker Hub'){
            steps{
                script{
                    withCredentials([string(credentialsId: 'dockerhubpwd', variable: 'dockerhubpwd')]) {
                    sh 'docker login -u abhijitsingh20 -p ${dockerhubpwd}'
                    sh 'docker push abhijitsingh20/java-ci-cd'

                    }
                }
            }
        }

    }
}