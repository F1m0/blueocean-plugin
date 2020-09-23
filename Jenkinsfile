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

stage('Install latest plugins') {
          steps {
          timeout(time: 90, unit: 'MINUTES') {
          sh "/var/jenkins_home/workspace/blueocean-plugin_master/ins_plugins.sh"
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
