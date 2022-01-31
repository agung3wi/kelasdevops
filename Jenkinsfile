node {
    checkout scm
  
    // deploy
    docker.image('agung3wi/alpine-rsync:1.1').inside('-u root') {
        sshagent (credentials: ['ssh-dev']) {
            sh 'mkdir -p ~/.ssh'
            sh 'ssh-keyscan -H "dev.kelasdevops.xyz" > ~/.ssh/known_hosts'
            sh "rsync -rav --delete ./laravel/ ubuntu@dev.kelasdevops.xyz:/home/ubuntu/dev.kelasdevops.xyz/"
        }
    }
}
