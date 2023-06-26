# Vars
IMAGE=item-app:v1

echo "======================================"
echo "| Build and push docker image script |"
echo "======================================\n"

# --------------------------------------------------------------------------------------------------------------------------
# 1. Perintah untuk membuat Docker image dari Dockerfile yang tadi dibuat, dengan nama image item-app, dan memiliki tag v1.
# --------------------------------------------------------------------------------------------------------------------------

# Build docker image
echo "Build image"
echo "--------------------------"
docker build -t $IMAGE .
echo "\n"

# --------------------------------------------------------------------------------------------------------------------------
# 2. Melihat daftar image di lokal.
# --------------------------------------------------------------------------------------------------------------------------

# List local docker images
echo "List local images"
echo "--------------------------"
docker image ls
echo "\n"

# --------------------------------------------------------------------------------------------------------------------------
# 3. Mengubah nama image agar sesuai dengan format Docker Hub (atau GitHub Packages bila menerapkan saran keempat).
# --------------------------------------------------------------------------------------------------------------------------

# Rename the image, can be done by tag command
echo "Rename image"
echo "--------------------------"
docker tag item-app ofid/$IMAGE
docker tag item-app ghcr.io/f1dz/$IMAGE
echo "\n"

# --------------------------------------------------------------------------------------------------------------------------
# 4. Login ke Docker Hub (atau GitHub Packages bila menerapkan saran keempat) via Terminal.
# --------------------------------------------------------------------------------------------------------------------------

# Login to docker
echo "Login to Docker Hub"
echo "--------------------------"
echo $PASSWORD_DOCKER_HUB | docker login -u ofid --password-stdin
echo "\n"

# --------------------------------------------------------------------------------------------------------------------------
# 5. Mengunggah image ke Docker Hub (atau GitHub Packages bila menerapkan saran keempat).
# --------------------------------------------------------------------------------------------------------------------------

# Push image to Docker Hub
echo "Push image to Docker Hub"
echo "--------------------------"
docker push ofid/$IMAGE
echo "\n"

# Push Image to Github Package done automatically by Github Action. Please refer to https://github.com/f1dz/item-app to see the Github workflow
# The built image can be found here https://github.com/f1dz/item-app/pkgs/container/item-app
# But can be done as well as follows:
echo "Login to Github and push the image"
echo "-----------------------------------"
echo $GITHUB_TOKEN | docker login ghcr.io -u f1dz --password-stdin
docker push ghcr.io/f1dz/$IMAGE
echo "\n"