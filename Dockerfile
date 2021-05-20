FROM wata727/tflint:0.28.0 AS tflint-image

FROM koalaman/shellcheck:v0.7.2 AS shellcheck-image

FROM hashicorp/terraform:0.14.11 AS terraform-image

FROM alpine:3.13.5

COPY *.sh /scripts/

# install bash, git and get version-specific tfsec
RUN apk add --update --no-cache bash git openssh aws-cli && \
    wget https://github.com/liamg/tfsec/releases/download/v0.39.26/tfsec-linux-amd64 && \
    chmod +x tfsec-linux-amd64 && \
    mv tfsec-linux-amd64 /bin/tfsec && \
    chmod +x -R /scripts/

# grab executables from previous stages
COPY --from=tflint-image /usr/local/bin/tflint /bin/
COPY --from=shellcheck-image /bin/shellcheck /bin/
COPY --from=terraform-image /bin/terraform /bin/

ENTRYPOINT ["/bin/bash", "-c"]
