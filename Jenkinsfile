#!groovy


properties([
  // only 20 builds,
  buildDiscarder(logRotator(artifactNumToKeepStr: '20', numToKeepStr: '20')),
  parameters([
    booleanParam(name: 'USE_SAUCELABS', defaultValue: false)
  ])
])




node() {

      stage('Setup') {
        deleteDir()
        checkout scm
        }


          stage('Building BlueOcean') {
            timeout(time: 90, unit: 'MINUTES') {
              sh "mvn clean install -DskipTests"
           }


                }
       finally {
        stage('Cleanup') {
          catchError(message: 'Suppressing error in Stage: Cleanup') {
            deleteDir()
          }
        }
      }
}
