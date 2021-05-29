pipeline {
    agent any
    environment {
      PATH = "${PATH}:${getterraform()}"
    }
    
    stages {
        stage('terraform init and apply- Dev ') {
            steps {
                sh returnStatus: true, script: 'terraform workspace new Dev'
                sh 'terraform init'
                sh 'terraform apply --auto-approve'
            }
        }
        stage('terraform init and apply -prod ') {
            steps {
                sh returnStatus: true, script: 'terraform workspace new Prod'
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
