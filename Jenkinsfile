pipeline {
    agent any

    tools {
        maven "maven3"
    }

    environment { 
        NEXUS_URL = '13.127.168.222:8081'
        NEXUS_REPO = 'spring-boot-app'
        NEXUS_CREDENTIALS_ID = 'nexus-credentials'
        ARTIFACT_VERSION = "${BUILD_NUMBER}"
        DOCKER_IMAGE = "shravankumarp/spring-boot-app:${BUILD_NUMBER}"
        REGISTRY_CREDENTIALS = credentials('docker-cred')
    }

    stages {

        stage('Clean Workspace') {
            steps {
                echo "Cleaning workspace..."
                cleanWs()
            }
        }

        stage('Git Checkout') {
            steps {
                echo "Checking out code from Git..."
                git branch: 'main', url: 'https://github.com/Shravankumar1989/CI-CD-Pipeline.git'
            }
        }

        stage('Build & Test') {
            steps {
                echo 'Building the project...'
                sh '''
                   cd spring-boot-app
                   mvn clean compile
                   mvn test
                '''
            }
        }

        stage('Package & Install') {
            steps {
                echo 'Packaging the project...'
                sh '''
                   cd spring-boot-app
                   mvn package
                   mvn install
                '''
            }
        }

        stage('Static Code Analysis') {
            steps {
                echo 'Running SonarQube analysis...'
                withSonarQubeEnv('sonar-server') {
                    sh '''
                       cd spring-boot-app
                       mvn sonar:sonar \
                       -Dsonar.projectKey=spring-boot-app \
                       -Dsonar.projectName=spring-boot-app
                    '''
                }
            }
        }

        stage('Quality Gate Check') {
            steps {
                echo 'Checking SonarQube quality gate...'
                script {
                    def qualityGate = waitForQualityGate()
                    if (qualityGate.status != 'OK') {
                        error "Pipeline aborted due to SonarQube quality gate failure: ${qualityGate.status}"
                    }
                }
            }
        }

        stage('Upload to Nexus') {
            steps {
                echo 'Uploading artifact to Nexus repository...'
                nexusArtifactUploader artifacts: [
                    [
                        artifactId: 'spring-boot-demo',
                        classifier: '',
                        file: 'spring-boot-app/target/spring-boot-web.jar',
                        type: 'jar'
                    ]
                ],
                credentialsId: NEXUS_CREDENTIALS_ID,
                groupId: 'com.Shravankumar',
                nexusUrl: NEXUS_URL,
                nexusVersion: 'nexus3',
                protocol: 'http',
                repository: NEXUS_REPO,
                version: ARTIFACT_VERSION
            }
        }

        stage('Build Docker Image') {
            steps {
                echo 'Building Docker image...'
                sh '''
                   cd spring-boot-app
                   docker build -t ${DOCKER_IMAGE} .
                '''
            }
        }

        stage('Scan Docker Image') {
            steps {
                echo 'Scanning Docker image using Trivy...'
                sh '''
                   trivy image ${DOCKER_IMAGE} > trivyimage.txt
                '''
            }
        }

        stage('Push Image') {
            steps {
                echo 'Pushing Docker image to registry...'
                script {
                    def dockerImage = docker.image("${DOCKER_IMAGE}")
                    docker.withRegistry('https://index.docker.io/v1/', 'docker-cred') {
                        dockerImage.push()
                    }
                }
            }
        }

        stage('Cleanup Trivy Cache') {
            steps {
                echo 'Cleaning up Trivy cache...'
                sh 'rm -rf /var/lib/jenkins/.cache/trivy/*'
            }
        }
    }

    post {
        success {
            echo 'Pipeline executed successfully!'  
        }
        failure {
            echo 'Pipeline failed. Please check the logs.'
        }
    }
}
