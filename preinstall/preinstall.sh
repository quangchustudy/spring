##!/bin/bash
#
#image_name="adoptopenjdk"
#image_tag="16_36-jre-hotspot"
##if aws ecr-public get-login-password --region us-east-1 | docker login --username AWS --password-stdin public.ecr.aws;
##$(aws ecr get-login --region $AWS_DEFAULT_REGION --no-include-email)
#if curl --head --silent --fail "https://public.ecr.aws/u8r7l3u8/adoptopenjdk:16_36-jre-hotspot"; then
#    echo "Image exists on Docker Hub: $image_name:$image_tag"
#else
#    echo "Image does not exist on Docker Hub: $image_name:$image_tag"
#    docker pull adoptopenjdk:16_36-jre-hotspot
#    docker tag $image_name:$image_tag public.ecr.aws/u8r7l3u8/$image_name:$image_tag
##    $(aws ecr get-login --region $AWS_DEFAULT_REGION --no-include-email)
#    docker push public.ecr.aws/u8r7l3u8/$image_name:$image_tag
#    echo "Image uploaded to Docker Hub: $image_name:$image_tag"
#fi
#!/usr/bin/env bash
# Example:
#    ./find-ecr-image.sh foo/bar mytag

if [[ $# -lt 2 ]]; then
    echo "Usage: $( basename $0 ) <repository-name> <image-tag>"
    exit 1
fi
#$(aws ecr get-login --region $AWS_DEFAULT_REGION --no-include-email)
IMAGE_META="$( aws ecr describe-images --repository-name=$1 --image-ids=imageTag=$2 2> /dev/null )"

if [[ $? == 0 ]]; then
    IMAGE_TAGS="$( echo ${IMAGE_META} | jq '.imageDetails[0].imageTags[0]' -r )"
    echo "$1:$2 found"
else
    echo "$1:$2 not found"
        docker pull $1:$2
#        docker tag adoptopenjdk:latest 243626120307.dkr.ecr.ap-southeast-1.amazonaws.com/adoptopenjdk:latest
        docker tag $1:$2 243626120307.dkr.ecr.ap-southeast-1.amazonaws.com/$1:$2
        $(aws ecr get-login --region $AWS_DEFAULT_REGION --no-include-email)
#    docker push 243626120307.dkr.ecr.ap-southeast-1.amazonaws.com/adoptopenjdk:latest
        docker push 243626120307.dkr.ecr.ap-southeast-1.amazonaws.com/$1:$2
        echo "Image uploaded to ECR Hub: $1:$2"
#    exit 1
fi
