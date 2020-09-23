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
          sh "cp -r blueocean/target/plugins /usr/share/jenkins/ref/plugins/"
          sh "for f in /usr/share/jenkins/ref/plugins/*.hpi; do mv "$f" "${f%%hpi}jpi"; done"
          sh "install-plugins.sh antisamy-markup-formatter matrix-auth"
          sh "for f in /usr/share/jenkins/ref/plugins/blueocean-*.jpi; do mv "$f" "$f.override"; done"
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
