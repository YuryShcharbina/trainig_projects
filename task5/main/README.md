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
`FROM` - Jenkins image from Dockerhub  
`ENV TZ` - set timezone 

Then build a Jenkins image from Dockerfile:  
```
$ docker build -t my_jenkins .
```
After build completed, you should run docker container with Jenkins:  
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
Paste this output(should be inserted yours) to "Administrator password" field and click **Continue**.  
After that choose **Select plugins to install** option and uncheck all.  
Finally, create your first administrator user.

## Configuring Jenkins
### Installing plugins
For work need to install plugins **Manage Jenkins->Manage Plugins**. In **Available** tab search and check next plugins  
and click **Download now and install after restart**:  
* Git
* Git Hub
* Pipeline  
* SSH Credentials
* SSH Build Agent
* SSH Agent
* Embeddable Build Status
* Role-based Authorization Strategy
* Authorize Project
* Docker
* Docker API  
* Docker pipeline
### Setup Global Security
For configuration global security parameters got to **Manage Jenkins-Security->Configure Global Security>**:   
In **Authentication** field check ***Disable remember me***  
In Authorization field select ***Project-based Matrix Authorization Strategy*** and chek rights as follows:
![](images/global_security.png)  
At last in **Access Control for Builds** select **Strategy**-*Run as a SYSTEM*
Finally click **Save** button.

### Setup build agents
On each build agent need to set up Java 11 for Jenkins agent correct work:
```angular2html
$ sudo apt install openjdk-11-jre
```
For connecting to build agents via ssh we need ssh key(maybe several keys).  
To create key pair, for example, run command in terminal on host machine:
```angular2html
$ ssh-keygen -t rsa -b 4096 -f .ssh/vm1_ext
```
Path to the key, and it's name(.ssh/vm1_ext) should be yours.  
If you don't want to set up password for key hit **Enter key** two times and key pair created:  
```angular2html
Generating public/private rsa key pair.
Enter passphrase (empty for no passphrase): 
Enter same passphrase again: 
Your identification has been saved in .ssh/vm1_ext
Your public key has been saved in .ssh/vm1_ext.pub
The key fingerprint is:
SHA256:B3+gP0WP+3U0IejZxMe22qH92jHG+0aO/3P+E2Ji6p8 ubuntu@ip-172-31-36-124
The key's randomart image is:
+---[RSA 4096]----+
|                 |
|            o .  |
|        . ...+ = |
|         +.o+o+ o|
|        S oo+..+.|
|         o = +*o+|
|          = +o.@+|
|         . ...o=X|
|        ...E  o*/|
+----[SHA256]-----+
```
Next in Jenkins page goto **Manage Jenkins->Mange Credentials**.  
Select **Store** *Jenkins->Global credentials* and on the left **Add credntials** and fill the form:  
![](images/add_ssh.png)
Private key paste entirely run coomand in terminal and paste output to form:  
```angular2html
-----BEGIN OPENSSH PRIVATE KEY-----
b3BlbnNzaC1rZXktdjEAAAAABG5vbmUAAAAEbm9uZQAAAAAAAAABAAACFwAAAAdzc2gtcn
NhAAAAAwEAAQAAAgEAvzMNSmDlvdIrXSWjEyDndDulpU/xAOHzi9S+BE4pb0D7K5MzxmYk
...
...
...
nNY6IYXSW7ImLaYv8j+d7CgSMaj2WL+Ct+3Dh50Lx/YiM7hFjDYJ/y0TdAZMmN9woZYAkP
Cg80wDvrlh+CXQAAABd1YnVudHVAaXAtMTcyLTMxLTM2LTEyNAEC
-----END OPENSSH PRIVATE KEY-----
```
Finally, click **Ok**.

Now goto **Mange Jenkins->Manage Nodes and Clouds** and on the left **New Node**.  
In next window input agent name, select *Permanent Agent* and click **Ok**.  
Further, fill agent data:
![](images/add_agent.png)
All data, such ip address, labels, etc., should be yours. **Launch method**  
select *Launch agents via SSH*, ssh key select for agents  (created on previous step),  
**Host Key Verification Strategy** select *Manually provided key Verification Strategy*.  
Click **Save**.  
After short period of time your agent wil be connected to the Jenkins master node.
Same you may add required amount of agents:  
![](images/agents.png)

## Create Freestyle project
To create Freestyle project on Jenkins page on te left select **New Item**.
In te next window enter a name for project and select **Freestyle Project**.
On *General* tab fill *Description* section and in *Build* section add build step with *Execute shell* and write some commands:
![](images/free_st_pr.png)
Click **Save**.  
On the main page run this task.

## Create Pipeline
Select **New Item**(see above). Enter name and select *Pipeline*.  
On *General* tab fill *Description* section and in *Pipeline* section select *Pipeline script* and write it:
![](images/pipeline.png)
Click **Save**.  
On the main page run this task.

## Create Pipeline #2
In this pipeline we use code from Github repository. For work with Github we need add  
additional cridentials for ssh(see "Setup for build agents"), but now we nee add public key  
to Github repository:
* copy content of the publick key, for example:
```angular2html
ssh-rsa AAAAB3NzaC1yc2EAAAADAQGBo0jhpRZ4y  
SHe/sbouhunVB8A9vNQ0Z5N9K1lJ2EFPG3fFwo06X  
MecOzIPcAHeXe3tiuPJ36Gz0/uldnSNDZu9zWGrvq  
...
...
z9D0wHHVNTnmGFQ== ubuntu@ip-172-31-36-124
```
* in Github account goto **Settings->SSH and GPG Keys->New SSH key**:
![](images/ssh_git.png)
  add *Title* for key, paste key and click **Add SSH key**  

Now create a new pipeline(see above), with content from *Jenkinsfile_2* in this directory,  
and run it.  


## Add encrypted variable to docker container
First we need to create new credentials(see above), but now in field **Kind** select *Secret text*:
![](images/secret_text.png)
After that create new pipeline with content from *Jenkinsfile_3* in this directory,  
and run it.