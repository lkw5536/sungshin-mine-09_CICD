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
			sh 'apt-get install -y build-essential curl'
			sh 'curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash'
			sh 'source ~/.nvm/nvm.sh'
			sh 'nvm install 18.15.0'
		}
	}
	stage('Push image') {
		docker.withRegistry('https://registry.hub.docker.com', 'opensourceteam6') {
			app.push("${env.BUILD_NUMBER}")
			app.push("latest")
		}
	}
}
