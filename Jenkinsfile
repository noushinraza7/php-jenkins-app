pipeline{
    agent any

    environment {
        IMAGE_NAME= 'noushinraza7/php-jenkins-demo'
        CONTAINER_NAME='php-demo'
        APP_PORT='9000'
    }
    stages{
        stage("checkout"){
            steps{
                git branch:'main', url:'https://github.com/noushinraza7/php-jenkins-app.git'
            }
        }
        stage("build Docker image"){
            steps{
            sh'''
                docker build -t ${IMAGE_NAME}:${BUILD_NUMBER} -t ${IMAGE_NAME}:latest .
                '''
            }
        }
        stage("push"){
            steps{
                withCredentials([
                    usernamePassword(credentialsID:'dockerhub',usernameVariable:'DOCKER_USER',passwordVariable:'DOCKER_TOKEN')
                ])
            }
        }

        STAGE("DEPLOY"){
            steps{
                sh'''
                    docker rm -f ${CONTAINER_NAME} || true
                    docker run -d --name ${CONTAINER_NAME} -p ${APP_PORT}:80 ${IMAGE_NAME}:${BUILD_NUMBER}
                '''
            }
        }
    }
}