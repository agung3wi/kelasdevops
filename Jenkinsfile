pipeline {
    agent none 
    stages {
        stage('Example Build') {
            // agent { docker 'maven:3.8.1-adoptopenjdk-11' } 
            // steps {
            //     echo 'Hello, Maven'
            //     sh 'mvn --version'
            // }
        }
        stage('Example Test') {
            // agent { docker 'openjdk:8-jre' } 
            // steps {
            //     echo 'Hello, JDK'
            //     sh 'java -version'
            // }
        }
        stage('Example Deploy') {
            agent { docker 'agung3wi/alpine-rsync:1.1' } 
            steps {
                sshagent (credentials: ['dev']) {
                    sh 'mkdir -p ~/.ssh'
                    sh 'ssh-keyscan -H "dev.kelasdevops.xyz" > ~/.ssh/known_hosts'
                    sh "rsync -rav --delete ./laravel/ ubuntu@dev.kelasdevops.xyz:/home/ubuntu/dev.kelasdevops.xyz/"
                }
            }

        }
    }
}