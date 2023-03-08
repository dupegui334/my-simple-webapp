# my-simple-webapp
Personal DevOps project with web app in flask, docker, Terraform, AWS, Ansible and Jenkins

## Web app
Web app designed with Flask where the user search for the name of a planet of the solar system and the app will retrieve all the info of the planet comming from the [API](https://api.le-systeme-solaire.net/swagger/)
- Exposes through port 5000.
- to execute container locally run: 
    ```
    docker run -d -p 5000:5000 sdupegui/planet-app:latest
    ```