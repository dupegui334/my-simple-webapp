# my-simple-webapp
Personal DevOps project with web app in flask, docker, Terraform, AWS, Ansible and Jenkins.
CI/CD using Jenkins pipeline to:
    1. Build a docker image and push it to the hub.
    2. Run the container based on the previous image (a Flask web application in port 5000).
 All this, every time someone makes a commit or a PR to branch main
 
## Web app & docker
Web app designed with Flask where the user search for the name of a planet of the solar system and the app will retrieve all the info of the planet comming from the [API](https://api.le-systeme-solaire.net/swagger/)
- Exposes through port 5000.
- to execute container locally run: 
    ```
    docker run -d -p 5000:5000 sdupegui/planet-app:latest
    ```
    
## Jenkins
Jenkins exposed in port 8080 by default. Create a pipeline job and in there select the Github integrations:
- Pipeline script from SCM and Github hook trigger.
- Set the credentials for docker hub login
- Set the credential to clone github repository (if it´s private).

## Github
Create a Github webhook and in the URL set the URL of: https//:Public-DNS/Jenkins-port/github-webhook/
