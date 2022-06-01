ECR_IMAGE_NAME=$1

export CODEARTIFACT_AUTH_TOKEN=$(/usr/local/bin/aws codeartifact get-authorization-token --profile ECRStaging --domain prod-backend --domain-owner 272324805001 --query authorizationToken --output text)

echo "check args"
if [ -z "$ECR_IMAGE_NAME" ]; then
  echo "please enter ECR_IMAGE_NAME"
  exit
fi

echo "ECR_IMAGE_NAME is $ECR_IMAGE_NAME"

mvn clean package -Dmaven.test.skip=true -Dmaven.clean.failOnError=false

echo "building docker image..."
docker build -t "$ECR_IMAGE_NAME" .

echo "build finish"
