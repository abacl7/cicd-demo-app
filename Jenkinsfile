node {
    def app

    stage('Clone repository') {
        checkout scm
    }

    stage('Build image') {
        app = docker.build('abacl7/cicd-demo-app')
    }

    stage('Push image') {
        docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-key') {
            app.push("${env.BUILD_VERSION}")
            app.push("latest")
        }
    }
}