# DevOps training project
## Description
This is the project made during the DevOps [Exadel](https://exadel.com/) Internship June2021.
It includes different
tasks which covered all aspects in DevOps workflow. 

## Project structure
Each task located in separate folder with appropriate name.
* Task1 - the purpose of this task was make a project repository using VSC Git
* Task2 - in this task created Web Server on EC2 instance
* Task3 - working with Docker:
  * Created setup_docker.sh for automatic installation docker in debian
  * Changed image kitematic/hello-world-nginx
  * In subtask3 built image based on debian with Apache web server,
    and updating on html page value of environment variable DEVOPS on
    startup, if provided
  * Image from subtask3 on Docker Hub [link](https://hub.docker.com/r/yurickch/test_web)
  * Created docker compose file with separate .env files for each service.  
* Task4 - working with ansible:
  * in main task installed ansible, made ping-pong to servers and  
    made playbook file to install docker on servers
  * in extra task made playbooks for install docker and LEMP stack  
  with dynamic inventory aws_ec2 plugin and jinja template 
* Task5 - working with Jenkins
___
#### Jobs status 
<br><image src="https://github.com/YuryShcharbina/training_projects/workflows/test-docker/badge.svg?branch=master">
[![Build Status](http://13.53.94.124:8080/buildStatus/icon?job=Pipeline_test_2&subject=Jenkins_test_pipeline)](http://13.53.94.124:8080/job/Pipeline_test_2/)  
___


### Author
Yury Shcharbina  
e-mail: yurickch@gmail.com

### Project status
In progress
