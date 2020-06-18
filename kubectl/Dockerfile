FROM alpine
ARG K8S_VERSION=v1.18.4
RUN apk add --no-cache ca-certificates && \
    wget -O /kubectl https://storage.googleapis.com/kubernetes-release/release/$K8S_VERSION/bin/linux/amd64/kubectl && \
    chmod +x /kubectl

FROM scratch
COPY --from=0 /kubectl /kubectl
ENTRYPOINT ["/kubectl"]
