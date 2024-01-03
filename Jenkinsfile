pipeline {
    agent any 
    options {
        ansiColor('xterm')
    }
    parameters {
        choice(name: 'ENV', choices: ['dev', 'prod'], description: 'Select the environment')
        choice(name: 'ACTION', choices: ['apply', 'destroy'], description: 'Select apply or destroy')
    }
    stages {
        stage('Terraform Init') {
            steps {
                sh "terrafile -f env-dev/Terrafile"
                sh "terraform init -backend-config=env-${ENV}/${ENV}-backend.tfvars"
            }
        }
        stage('Terraform Plan') {
            steps {
                sh "terraform plan -var-file=env-${ENV}/${ENV}.tfvars -var ENV=${ENV}"
            }
        }
        stage('Terraform Apply') {
            steps {
                sh "terraform ${ACTION} -auto-approve -var-file=env-${ENV}/${ENV}.tfvars -var ENV=${ENV}"
            }
        }
    }
}