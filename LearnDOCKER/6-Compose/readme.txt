#install docker-compose command --> Ref - https://docs.docker.com/compose/install/
curl -L "https://github.com/docker/compose/releases/download/1.25.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

#Create docker-compose.yml
    #create service for redis use volume for data persistant
    #create service for web which will depend upon redis
    #create volume for redis

#build image
docker-compose build

#start container with docker compose
docker-compose up -d    ----> if required image is not build then this command will build image first then will start container.

#Stop container with docker compose
docker-compose down