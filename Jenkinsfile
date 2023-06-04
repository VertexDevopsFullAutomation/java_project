pipeline{
    agent any
    
    tools {
        maven 'mymaven'
            }
    
    stages{
        
        stage('Git Clone'){
            
            steps{
                git branch: 'UAT', url: 'https://github.com/VertexDevopsFullAutomation/java_project.git'
            }
        }
        
        stage("SonarQube_check_quality"){
            
            steps{
                script{
                    withSonarQubeEnv(credentialsId: 'sonartoken') {
                      sh 'mvn sonar:sonar'
                      
                   }
                    def qg = waitForQualityGate()
                      if (qg.status != 'OK') {
                           error "Pipeline aborted due to quality gate failure: ${qg.status}"
                      }
                    sh "mvn clean install"
                   
                  }
               }
             }  
        
        stage('Docker Build'){
            steps{
<<<<<<< HEAD
                sh 'docker build -t vertexdevops/uat .'
=======
                sh 'docker build -t vertexdevops/sit .'
>>>>>>> 2762d4f (Update Jenkinsfile)
            }
        }
        
        stage('Docker Push'){
            steps{
                withCredentials([string(credentialsId: 'Dockerhub', variable: 'dockerpush')]) {
                sh 'docker login -u vertexdevops -p ${dockerpush}'
                }
<<<<<<< HEAD
                 sh 'docker push vertexdevops/uat'
=======
                 sh 'docker push vertexdevops/sit'
>>>>>>> 2762d4f (Update Jenkinsfile)
            }
           
        }
    }
}
