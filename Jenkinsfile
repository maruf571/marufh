pipeline {

    agent any
    environment {
     // shortCommit = sh(returnStdout: true, script: "git log -n 1 --pretty=format:'%h'").trim()
     // version = readMavenPom().getVersion()
     image = "eu.gcr.io/marufh/marufh:1.0.6"
     PATH="/var/lib/jenkins/google-cloud-sdk/bin:$PATH"
    }

    stages {
        stage('Build') {
            steps {
                sh 'docker build . -t ${image}'
                sh 'gcloud auth configure-docker'
                sh 'docker push ${image}'
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
