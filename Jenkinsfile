// pipeline {
//     agent any 
//     options {
//         ansiColor('xterm')
//     }
//     parameters {
//         choice(name: 'ENV', choices: ['dev', 'prod'], description: 'Select the environment')
//         choice(name: 'ACTION', choices: ['apply', 'destroy'], description: 'Select apply or destroy')
//     }
//     stages {
//         stage('Terraform Init') {
//             steps {
//                 sh "terrafile -f env-dev/Terrafile"
//                 sh "terraform init -backend-config=env-${ENV}/${ENV}-backend.tfvars"
//             }
//         }
//         stage('Terraform Plan') {
//             steps {
//                 sh "terraform plan -var-file=env-${ENV}/${ENV}.tfvars -var ENV=${ENV}"
//             }
//         }
//         stage('Terraform Apply') {
//             steps {
//                 sh "terraform ${ACTION} -auto-approve -var-file=env-${ENV}/${ENV}.tfvars -var ENV=${ENV}"
//             }
//         }
//     }
// }

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
        stage('Creating VPC') {
            steps {
                dir("VPC") {
                git branch: 'main', credentialsId: 'GitLabCred', url: 'https://github.com/b56-clouddevops/terraform-vpc.git'
                        sh "terrafile -f env-dev/Terrafile"
                        sh "terraform init -backend-config=env-${ENV}/${ENV}-backend.tfvars"
                        sh "terraform plan -var-file=env-${ENV}/${ENV}.tfvars -var ENV=${ENV}"
                        sh "terraform apply -auto-approve -var-file=env-${ENV}/${ENV}.tfvars -var ENV=${ENV}"
                }
            }
        }
        stage('Creating Loadbalancers') {
            steps {
                dir("ALB") {
                git branch: 'main', credentialsId: 'GitLabCred', url: 'https://github.com/b56-clouddevops/terraform-loadbalancers.git'
                        sh "terrafile -f env-dev/Terrafile"
                        sh "terraform init -backend-config=env-${ENV}/${ENV}-backend.tfvars"
                        sh "terraform plan -var-file=env-${ENV}/${ENV}.tfvars -var ENV=${ENV}"
                        sh "terraform apply -auto-approve -var-file=env-${ENV}/${ENV}.tfvars -var ENV=${ENV}"
                }
            }
        }
        stage('Creating Databases') {
            steps {
                dir("DB") {
                git branch: 'main', credentialsId: 'GitLabCred', url: 'https://github.com/b56-clouddevops/terraform-databases.git'
                        sh "terrafile -f env-dev/Terrafile"
                        sh "terraform init -backend-config=env-${ENV}/${ENV}-backend.tfvars"
                        sh "terraform plan -var-file=env-${ENV}/${ENV}.tfvars -var ENV=${ENV}"
                        sh "terraform apply -auto-approve -var-file=env-${ENV}/${ENV}.tfvars -var ENV=${ENV}"
                }
            }
        }
    }
}