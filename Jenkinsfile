node {
    checkout scm
  
    // deploy env dev
    docker.image('agung3wi/alpine-rsync:1.1').inside('-u root') {
        sshagent (credentials: ['ssh-dev']) {
            sh 'mkdir -p ~/.ssh'
            sh 'ssh-keyscan -H "dev.kelasdevops.xyz" > ~/.ssh/known_hosts'
            sh "rsync -rav --delete ./laravel/ ubuntu@dev.kelasdevops.xyz:/home/ubuntu/dev.kelasdevops.xyz/ --exclude=.env --exclude=storage --exclude=.git"
            sh "ssh ubuntu@dev.kelasdevops.xyz 'cd ~/dev.kelasdevops.xyz/ && rm composer.lock && composer install'"
        }
    }
    
    // deploy env prod
    docker.image('agung3wi/alpine-rsync:1.1').inside('-u root') {
        sshagent (credentials: ['ssh-prod']) {
            sh 'mkdir -p ~/.ssh'
            sh 'ssh-keyscan -H "prod.kelasdevops.xyz" > ~/.ssh/known_hosts'
            sh "rsync -rav --delete ./laravel/ ubuntu@prod.kelasdevops.xyz:/home/ubuntu/prod.kelasdevops.xyz/ --exclude=.env --exclude=storage --exclude=.git"
            sh "ssh ubuntu@prod.kelasdevops.xyz 'cd ~/prod.kelasdevops.xyz/ && rm composer.lock && composer install'"
        }
    }
}
