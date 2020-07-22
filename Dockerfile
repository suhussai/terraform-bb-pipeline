FROM wata727/tflint:0.17.0 AS tflint-image

FROM koalaman/shellcheck:v0.7.1 AS shellcheck-image

FROM hashicorp/terraform:0.12.28 AS terraform-image

FROM alpine:3.12.0

COPY . /scripts/

# install bash, git and get version-specific tfsec and terragrunt
RUN apk add --update --no-cache bash git openssh && \
    wget https://github.com/liamg/tfsec/releases/download/v0.23.2/tfsec-linux-amd64 && \
    chmod +x tfsec-linux-amd64 && \
    mv tfsec-linux-amd64 /bin/tfsec && \
    wget https://github.com/gruntwork-io/terragrunt/releases/download/v0.23.31/terragrunt_linux_amd64 && \
    chmod +x terragrunt_linux_amd64 && \
    mv terragrunt_linux_amd64 /bin/terragrunt && \
    chmod +x -R /scripts/

# grab executables from previous stages
COPY --from=tflint-image /usr/local/bin/tflint /bin/
COPY --from=shellcheck-image /bin/shellcheck /bin/
COPY --from=terraform-image /bin/terraform /bin/

# same as Bitbucket pipeline entrypoint
ENTRYPOINT [ "/bin/bash" ]
