pipeline {
    agent any
  

   stages {
      stage('Setup') {
        steps {
        deleteDir()
        checkout scm
        }
}

        stage('Building BlueOcean') { 
          steps {
          timeout(time: 90, unit: 'MINUTES') {
          sh "mvn clean install -DskipTests"
           }
}
}
                
        stage('Cleanup') { 
          steps {
          catchError(message: 'Suppressing error in Stage: Cleanup') {
            deleteDir()
          }
        }
      
}
}
}
