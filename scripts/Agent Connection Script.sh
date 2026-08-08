#!/bin/bash
# agent-setup/install-agent.sh

# Install Java on agent
sudo apt update
sudo apt install openjdk-21-jdk git -y

# Create jenkins user
sudo useradd -m -s /bin/bash jenkins

# Create agent directory
sudo mkdir -p /opt/jenkins-agent
sudo chown jenkins:jenkins /opt/jenkins-agent

# Download agent.jar from controller
# Replace JENKINS_URL with your controller IP
JENKINS_URL="http://your-controller-ip:8080"
wget ${JENKINS_URL}/jnlpJars/agent.jar -O /opt/jenkins-agent/agent.jar

# Create agent connection script
cat > /opt/jenkins-agent/connect-agent.sh << 'EOF'
#!/bin/bash
JENKINS_URL="http://your-controller-ip:8080"
AGENT_NAME="remote-agent-1"
AGENT_SECRET="your-agent-secret-from-jenkins"
WORK_DIR="/opt/jenkins-agent/workspace"

java -jar /opt/jenkins-agent/agent.jar \
  -url ${JENKINS_URL} \
  -secret ${AGENT_SECRET} \
  -name ${AGENT_NAME} \
  -workDir ${WORK_DIR}
EOF

chmod +x /opt/jenkins-agent/connect-agent.sh
chown jenkins:jenkins /opt/jenkins-agent/connect-agent.sh
