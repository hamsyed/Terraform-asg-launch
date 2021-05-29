pipeline {
    agent any
    environment {
      PATH = "${PATH}:${getterraform()}"
    }
    
    stages {
        stage('terraform init and apply ') {
            steps {
                sh returnStatus: true, script: 'terraform workspace new Dev'
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
