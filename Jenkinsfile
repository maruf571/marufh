pipeline {

    agent any
    environment {
     shortCommit = sh(returnStdout: true, script: "git log -n 1 --pretty=format:'%h'").trim()   
     // version = readMavenPom().getVersion()
     image = "eu.gcr.io/marufh/marufh:1.0.0"
    }

    stages {
        stage('Build') {
            steps {
                sh 'whoami'
                sh 'docker build . -t ${image}'
                sh 'docker push ${image}'
            }
        }

        stage('Deploy Image to GKC') {
            when { branch 'master' }
            steps {
                sh 'kubectl apply -f deployment/deployment.yml'
            }
        }


    }


/*
    stages {
        stage('Build') {

            agent {
              docker {
                image 'maven:3-alpine'
                args '-v /root/.m2:/root/.m2'
              }
            }
            steps {
                sh 'mvn -B -DskipTests clean package'
                stash includes: 'target/*.jar', name: 'targetfiles'
            }
        }


        stage('Unit Test') {
            steps {
                sh 'mvn test'
            }
        }

        stage('Integration Test') {
            steps {
                sh 'mvn verify'
            }
        }


        stage('Build & Push Image') {
            steps {
                unstash 'targetfiles'
                sh 'docker build . -t ${image}'
                sh 'docker push ${image}'
            }
        }

        stage('Deploy Image') {
            when { branch 'master' }
            steps {
                sh 'kubectl apply -f br-deployment.yml'
            }
        }
    }
     */
}
