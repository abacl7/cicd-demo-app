node {
    def app
    def version = VersionNumber(versionNumberString: '${BUILD_DATE_FORMATTED, \"yyyy.MM.dd.HH.mm.ss\".'}

    stage('Clone repository') {
        checkout scm
    }

    stage('Build image') {
        app = docker.build('abacl7/cicd-demo-app')
    }

    stage('Push image') {
        docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-key') {
            app.push(version)
            app.push("latest")
        }
    }
}