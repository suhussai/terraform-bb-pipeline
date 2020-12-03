## Overview

This image was created to help make pipeline executions more efficient. The idea is that instead of downloading a base linux image and then downloading all of the required executables on it, why not just create an image that has those executables already installed? That way, pipelines can just pull that image and get to work instead of spending time at the start of each execution prepping the environment. 

*TODO: Once we have an official DockerHub account to publish this image to, we will update the flow so that new images are published to that account. Right now, we are using a DockerHub account created by Syed to host these images. That DockerHub account is: https://hub.docker.com/u/syedhussainrackspace*

## Image Types

This section outlines the different types of image that are hosted and available for use. They are made distinct by the tag value that is used.

### Terragrunt Pipeline
#### Description
This image is an alpine (3.12.0) container that contains executables for:
* tflint (0.17.0)
* shellcheck (v0.7.1)
* terraform (0.12.28)
* tfsec (v0.23.2)
* terragrunt (v0.23.31)

#### Latest Tag
`0.0.5`

[GitHub Tag](https://github.com/suhussai/terraform-bb-pipeline/tree/0.0.5)

[DockerHub Image](https://hub.docker.com/layers/syedhussainrackspace/bb_image/release-0.0.5/images/sha256-78a1cc380b9e8734414776dd26ed356fbf83321a9a30d5485c106beb5a02ddf5)

```
docker pull syedhussainrackspace/bb_image:release-0.0.5
``` 

### Terraform Pipeline
#### Description
This image is an alpine (3.12.0) container that contains executables for:
* tflint (0.17.0)
* shellcheck (v0.7.1)
* terraform (0.12.28)
* tfsec (v0.23.2)

#### Latest Tag
`0.1.4`

[GitHub Tag](https://github.com/suhussai/terraform-bb-pipeline/tree/0.1.4)

[DockerHub Image](https://hub.docker.com/layers/syedhussainrackspace/bb_image/release-0.1.4/images/sha256-d738880300367ad4b0929c3b689876b5e9788e1ca95277d7cb39be8c19f784a8)

```
docker pull syedhussainrackspace/bb_image:release-0.1.4
```     

### Linting Pipeline
#### Description
This image is an alpine (3.12.0) container that contains executables for:
* tflint (0.17.0)
* tfsec (v0.23.2)

#### Latest Tag
`0.2.0`

[GitHub Tag](https://github.com/suhussai/terraform-bb-pipeline/tree/0.2.0)

[DockerHub Image](https://hub.docker.com/layers/syedhussainrackspace/bb_image/release-0.2.0/images/sha256-9300306f4fce3cfe2041c550fb423bb3964cafd455d57fe88a9c38ecefa9a0cf)
```
docker pull syedhussainrackspace/bb_image:release-0.2.0
```
 

## Releasing New Versions

The process for releasing a new version is very simple. Dockerhub is already configured to detect new tags. Once it finds a new version that follows the above format, it builds the image and makes it available for public use.

### Terragrunt Pipeline

1. Clone this repo:  https://github.com/suhussai/terraform-bb-pipeline
2. Switch to the terragrunt_image branch
3. Make necessary changes
4. Commit them
5. Tag the new commits. Ensure that the new tag is the smallest increment from the current tag (i.e. if current tag = 0.0.5, then new tag = 0.0.6)
6. Push the commit and tags to the remote repo

Done!

### Terraform Pipeline

1. Clone this repo:  https://github.com/suhussai/terraform-bb-pipeline
2. Switch to the vanilla_pipeline branch
3. Make necessary changes
4. Commit them
5. Tag the new commits. Ensure that the new tag is the smallest increment from the current tag (i.e. if current tag = 0.0.5, then new tag = 0.0.6)
6. Push the commit and tags to the remote repo

Done!

### Linting Pipeline

1. Clone this repo:  https://github.com/suhussai/terraform-bb-pipeline
2. Switch to the linting_pipeline branch
3. Make necessary changes
4. Commit them
5. Tag the new commits. Ensure that the new tag is the smallest increment from the current tag (i.e. if current tag = 0.0.5, then new tag = 0.0.6)
6. Push the commit and tags to the remote repo

Done!

