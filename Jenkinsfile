node {
	def app
	stage('Clone repository') {
		git branch:'main',
			url:'https://github.com/lkw5536/sungshin-mine-09_CICD.git'
	}
	stage('Build image') {
		app = docker.build("opensourceteam6/opensourceteam6")
	}
	stage('Test image') {
		app.inside {
			sh 'echo hello'
		}
	}
	stage('Push image') {
		docker.withRegistry('https://registry.hub.docker.com', 'opensourceteam6') {
			app.push("${env.BUILD_NUMBER}")
			app.push("latest")
		}
	}
}
