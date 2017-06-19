node {
    def app

    stage('Clone repository') {
        git url: 'https://github.com/abacl7/cicd-demo-app.git'
    }

    stage('Build image') {
        app = sh "sudo docker build -t abacl7/cicd-demo-app ."
    }

    stage('Push image') {
        docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-key') {
            app.push("${env.BUILD_VERSION}")
            app.push("latest")
        }
    }
}