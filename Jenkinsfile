
def pull_image() {
    wrap([$class: 'AnsiColorBuildWrapper', 'colorMapName': 'XTerm']) {
        sh '''
        #!/usr/env/bin bash
        docker pull mojdigitalstudio/hmpps-ansible-builder:latest
        '''
    }
}

def run_ansible() {
    wrap([$class: 'AnsiColorBuildWrapper', 'colorMapName': 'XTerm']) {
        sh """
        #!/usr/env/bin bash
        set +x
        docker run \
            --rm \
            -v `pwd`:/home/tools/data \
            -v ~/.aws:/home/tools/.aws:ro \
            mojdigitalstudio/hmpps-ansible-builder:latest \
             bash -c "AWS_DEFAULT_REGION=eu-west-2 ansible-playbook generate_secrets.yml"
        """
    }
}

pipeline {
    agent { label "jenkins_slave"}

    stages {
        stage ('Notify build started') {
            steps {
                slackSend(message: "Build Started - ${env.JOB_NAME} ${env.BUILD_NUMBER} (<${env.BUILD_URL.replace(':8080','')}|Open>)")
            }
        }

        stage('Prepare Images') {
            steps {
                pull_image()
            }
        }

        stage('Manage Hosted Zones') {
            steps {
                run_ansible()
            }
        }

    }

    post {
        success {
            slackSend(message: "Build completed - ${env.JOB_NAME} ${env.BUILD_NUMBER}", color: 'good')
        }
        failure {
            slackSend(message: "Build failed - ${env.JOB_NAME} ${env.BUILD_NUMBER}", color: 'danger')
        }
    }
}
