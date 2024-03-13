## Jenkins Installation - Ubuntu(Linux)

#### [Jenkins offcial installation](https://www.jenkins.io/doc/book/installing/linux/)
#### Prerequisites
Minimum hardware requirements:
- 256 MB of RAM
- 1 GB of drive space (although 10 GB is a recommended minimum if running Jenkins as a Docker container)

##### Download and install jenkins
```
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update
sudo apt-get install jenkins
```
##### Install Java
Jenkins requires Java to run, yet not all Linux distributions include Java by default. Additionally, not all Java versions are compatible with Jenkins.
```
sudo apt update
sudo apt install fontconfig openjdk-17-jre
java -version
openjdk version "17.0.8" 2023-07-18
OpenJDK Runtime Environment (build 17.0.8+7-Debian-1deb12u1)
OpenJDK 64-Bit Server VM (build 17.0.8+7-Debian-1deb12u1, mixed mode, sharing)
```

##### Start Jenkins
You can enable the Jenkins service to start at boot with the command
```
sudo systemctl enable jenkins
```
You can start the Jenkins service with the command:
``` 
sudo systemctl status jenkins
```
You can check the status of the Jenkins service using the command:
```
sudo systemctl status jenkins
```

#### Post-installation setup

##### Unlocking Jenkins
When you first access a new Jenkins instance, you are asked to unlock it using an automatically-generated password.

Jenkins default port is 8080. Browse to http://localhost:8080 and wait until the Unlock Jenkins page appears.

