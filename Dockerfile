FROM wata727/tflint:0.17.0 AS tflint-image

FROM alpine:3.12.0

RUN apk add --update --no-cache bash git openssh && \
    wget https://github.com/liamg/tfsec/releases/download/v0.23.2/tfsec-linux-amd64 && \
    chmod +x tfsec-linux-amd64 && \
    mv tfsec-linux-amd64 /bin/tfsec

# grab executables from previous stages
COPY --from=tflint-image /usr/local/bin/tflint /bin/

ENTRYPOINT ["/bin/bash", "-c"]
