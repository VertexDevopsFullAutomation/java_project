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
                   
                  }
               }
             }  
        
        stage('Docker Build'){
            steps{
                sh 'docker build -t vertexdevops/docker_image:3 .'
            }
        }
        
        stage('Docker Push'){
            steps{
                withCredentials([string(credentialsId: 'Dockerhub', variable: 'dockerpush')]) {
                sh 'docker login -u vertexdevops -p ${dockerpush}'
                }
                 sh 'docker push vertexdevops/docker_image:3'
            }
           
        }
    }
}
