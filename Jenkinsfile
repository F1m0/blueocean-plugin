pipeline {
    agent {
        docker {
            image 'maven:3-alpine'
            args '-v /root/.m2:/root/.m2'
        }
    }

stages {
      stage('Setup') {
        deleteDir()
        checkout scm
        }


          stage('Building BlueOcean') {
            timeout(time: 90, unit: 'MINUTES') {
              sh "mvn clean install -DskipTests"
           }


                }
        stage('Cleanup') {
          catchError(message: 'Suppressing error in Stage: Cleanup') {
            deleteDir()
          }
        }
      }
}
