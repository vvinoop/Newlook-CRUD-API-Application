Create Docker File
AS this requires aspdot net core, add the entry in the docker file.

One created, run the command : 
Docker build . -t coffeebook-master
# docker run, with a name in which it will called, and then write the # name of the image
Docker run the -p 8080:80 --name coffeebookimage imagename

# Once you have created the docker image you can check using the command
Docker images


#Now login to ACR using admin username and password from ACR.
# docker login [loginservername] --username [username] --passowrd [password]

docker login newlookcrvv.azurecr.io --username newlookcrvv --password vcs4AcruRSunBFXaWzh/5VsPHODaKmmPMDuqqGpIto+ACRA8ZC7M

# If this doesn't work copy the password in a txt file and run the command below :
cat ~/my_password.txt | docker login newlookcrvv.azurecr.io --username newlookcrvv --password-stdin

Got permission denied while trying to connect to the Docker daemon socket at unix:///var/run/docker.sock: Post "http://%2Fvar%2Frun%2Fdocker.sock/v1.24/auth": dial unix /var/run/docker.sock: connect: permission denied
# you need to run this command to change the permission.
sudo chmod 666 /var/run/docker.sock


# Tag the image to push to ACR
docker tag [imagename]:[version] [loginservername]/[namewhat you like to give]
docker tag coffeeimage:latest newlookcrvv.azurecr.io/coffeeimage

# use the docker push command to upload to ACR with tagged image.
docker push [new image name which was tagged]
docker push newlookcrvv.azurecr.io/coffeeimage

