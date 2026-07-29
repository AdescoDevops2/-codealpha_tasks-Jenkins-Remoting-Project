# codealpha_tasks-Jenkins-Remoting-Project
Overview
This project demonstrates how to configure Jenkins Remoting by connecting a remote Jenkins agent to a Jenkins controller. The setup enables distributed builds, allowing jobs to run on remote machines instead of the controller, improving scalability, performance, and security.

Project Objectives

- Install Jenkins on a controller server.
- Configure a remote Jenkins agent.
- Connect the agent using Jenkins Remoting ("agent.jar").
- Execute build jobs on the remote agent.
- Integrate Jenkins with a GitHub repository.
- Learn the fundamentals of distributed builds in Jenkins.

Architecture

             Jenkins Controller (Master)
                 Ubuntu EC2 Instance
                        │
          Jenkins Remoting (agent.jar)
                        │
                        ▼
             Jenkins Agent (Ubuntu EC2)
         Executes Build and Deployment Jobs

Prerequisites

- AWS Account
- Two Ubuntu EC2 instances
- Java 17
- Jenkins
- Git
- Internet connection

Technologies Used

- Jenkins
- Jenkins Remoting
- Java 17
- Ubuntu 22.04
- Git
- GitHub
- Amazon EC2
- Linux Shell

---

Project Structure

jenkins-remoting-project/
│
├── README.md
├── scripts/
│   ├── install-java.sh
│   ├── install-jenkins.sh
│   └── connect-agent.sh
│
└── screenshots/
    ├── jenkins-dashboard.png
    ├── node-online.png
    └── build-success.png

---

Installation Steps

1. Launch Two EC2 Instances

- Jenkins Controller
- Jenkins Agent

2. Install Java

sudo apt update
sudo apt install openjdk-17-jdk -y

3. Install Jenkins

Install Jenkins on the controller and start the service.

4. Configure the Agent

Create a new node in Jenkins and configure:

- Remote Root Directory
- Labels
- Launch method

5. Download agent.jar

wget http://CONTROLLER-IP:8080/jnlpJars/agent.jar

6. Connect the Agent

java -jar agent.jar \
-url http://CONTROLLER-IP:8080 \
-secret YOUR_SECRET \
-name ubuntu-agent \
-workDir "/home/ubuntu/jenkins"

The Jenkins dashboard should display the agent as Online.

---

Running a Build

1. Create a Freestyle Project.
2. Restrict the project to the agent label.
3. Add a build step:

hostname
pwd
whoami
java -version

4. Click Build Now.

The build executes on the remote Jenkins agent.

---

Expected Output

- Agent successfully connected.
- Node status shows Online.
- Build completed successfully.
- Console output displays the remote agent's hostname.

---

Skills Gained

- Jenkins installation
- Jenkins controller and agent configuration
- Jenkins Remoting ("agent.jar")
- Distributed builds
- CI/CD fundamentals
- Linux administration
- AWS EC2 management

Future Improvements

- Configure SSH-based agents.
- Use Docker as Jenkins build agents.
- Deploy applications automatically to AWS EC2.
- Integrate Docker and Kubernetes.
- Build a complete CI/CD pipeline using GitHub, Jenkins, Docker, and AWS.

Ojo Emmanuel-Adeiza

Cybersecurity | DevOps | AWS Cloud Engineer | Network Engineer


License

This project is provided for educational and learning purposes.
