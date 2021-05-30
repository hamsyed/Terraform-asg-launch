pipeline {
    agent any
    environment {
      PATH = "${PATH}:${getterraform()}"
    }
    
    stages {
        stage('terraform init and apply- Dev ') {
            steps {
                sh returnStatus: true, script: 'terraform workspace new ${params.Enviornment}'
                sh 'terraform init'
                sh 'terraform apply --auto-approve'
            }
        }
        stage('terraform init and apply -prod ') {
            steps {
                sh returnStatus: true, script: 'terraform workspace new ${params.Enviornment}'
                sh 'terraform init'
                sh 'terraform apply --auto-approve'
            }
        }
    }
}

def getterraform(){
   def toolterr = tool name: 'Myterraform', type: 'terraform'
    return toolterr
}

parameters {
  choice choices: ['Dev', 'Prod'], description: 'Please select the environment ', name: 'Enviornment'
}
