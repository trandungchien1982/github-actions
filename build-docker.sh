# You need to login into the Docker Registry first by using `docker login`
export IMAGE_NAME_GLOBAL=tdchien1982/github-actions:03.ci-java-hello-world-2.0

echo "Update information of Build Docker Image"
echo "Build Docker Image for Java HelloWorld: $IMAGE_NAME_GLOBAL"
uname -a
echo Check Docker Version
docker version

echo "Remove the old image (if exists) $IMAGE_NAME_GLOBAL"
docker stop java-hello-world-gha-demo
docker rm java-hello-world-gha-demo
docker image rm $IMAGE_NAME_GLOBAL --force

echo "Create Docker Image for Java Project: $IMAGE_NAME_GLOBAL"
docker build ./hello-world-app -t "$IMAGE_NAME_GLOBAL"

echo Push new image to Docker Registry
docker images

docker logout
docker login -u "$LOGIN_DOCKER_USR" -p "$LOGIN_DOCKER_PWD"
docker push "$IMAGE_NAME_GLOBAL"

echo "Run App using Docker on localhost"
echo "Show Docker Information now ..."
docker info
#docker run -p 9300:8100 --name java-hello-world-gha-demo -d --env PORT=8100 "$IMAGE_NAME_GLOBAL"
