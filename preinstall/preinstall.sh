#!/bin/bash

image_name="adoptopenjdk"
image_tag="16_36-jre-hotspot"
#if aws ecr-public get-login-password --region us-east-1 | docker login --username AWS --password-stdin public.ecr.aws;
$(aws ecr get-login --region $AWS_DEFAULT_REGION --no-include-email)
if curl --head --silent --fail "https://public.ecr.aws/u8r7l3u8/adoptopenjdk:16_36-jre-hotspot"; then
    echo "Image exists on Docker Hub: $image_name:$image_tag"
else
    echo "Image does not exist on Docker Hub: $image_name:$image_tag"
    docker pull adoptopenjdk:16_36-jre-hotspot
    docker tag $image_name:$image_tag public.ecr.aws/u8r7l3u8/$image_name:$image_tag
    $(aws ecr get-login --region $AWS_DEFAULT_REGION --no-include-email)
    docker push public.ecr.aws/u8r7l3u8/$image_name:$image_tag
    echo "Image uploaded to Docker Hub: $image_name:$image_tag"
fi
