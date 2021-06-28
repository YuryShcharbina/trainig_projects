## Install Jenkins in Docker container
On host machine(in this task I used AWS EC2 instance with Ubuntu 20.04 LTS) you need to install
Docker. It can do with setup_docker.sh script from task3.  
Further, install Java 11 for run host machine as a jenkins agent:  
```
$ sudo apt install openjdk-11-jre
```
In user home directory make working directories(for example):
```
$ mkdir -p test_jenkins{jenkins_data,jenkins_agent_data}
```
In test_jenkins directory make a Dockerfile or copy from this repository(main directory in task5):
```Dockerfile
FROM jenkins/jenkins:lts-jdk11
ENV TZ Europe/Moscow
```
where,  
`FROM` - image for jenkins agent from Dockerhub  
`ENV TZ` - set timezone 

Then build a Jenkins image from Dockerfile:  
```
$ docker build -t my_jenkins .
```
After build complited, you should run docker container with Jenkins:  
```angular2html
$ docker run -d -p 8080:8080 -v /home/ubuntu/test_jenkins/jenkins_data:/var_jenkins_home \  
  --name jenkins_master my_jenkins
```
This will start Jenkins in docker container, where:  
`-d` - run container in detached mode  
`-p 8080:8080` - publish port 8080 on the host  
`-v ` - bind /var/jenkins_home directory to /home/ubuntu/test_jenkins/jenkins_data mount point on host  
`--name` - name of running container  
`my_jenkins` - image for container  

After start, open browser and put address for Jenkins master node  
(address need to be changed to correct): `http://13.13.13.13:8080`:  
![](images/unlock-jenkins-page.jpg)  

Password can be obtained from output :  
```angular2html
$ cat /home/ubuntu/test_jenkins/jenkins_data/secrets/initialAdminPassword

2g3453gghffdfg3434dfd21
```
Paste this output(should be inserted yours) to "Administrator password" field and click __Continue__.  
After that choose __Select plugins to install__ option and uncheck all.  
Finally, create your first administrator user.


