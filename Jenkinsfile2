pipeline{
    agent any
    
    tools {
        maven 'mymaven'
            }
    
    stages{
        
        stage('Git Clone'){
            
            steps{
                git branch: 'main', url: 'https://github.com/VertexDevopsFullAutomation/java_project.git'
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
                sh 'docker build -t vertexdevops/production .'
            }
        }
        
        stage('Docker Push'){
            steps{
                withCredentials([string(credentialsId: 'Dockerhub', variable: 'dockerpush')]) {
                sh 'docker login -u vertexdevops -p ${dockerpush}'
                }
                 sh 'docker push vertexdevops/production'
            }
           
        }
    }
}
