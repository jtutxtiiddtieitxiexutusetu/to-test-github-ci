#!/bin/bash -li

image_name="nest-ci-image" ;
docker build --target production_image -t $image_name:latest . ;

# now you can push the image into a repository for production.
# EDIT HERE