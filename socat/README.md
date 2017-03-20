Use for run Docker remote API on Mac

    docker run \
            --detach \
            --restart always \
            --volume /var/run/docker.sock:/var/run/docker.sock \
            --publish 127.0.0.1:2376:2375 \
        vlastv/socat \
            socat \
            TCP-LISTEN:2375,reuseaddr,fork \
            UNIX-CONNECT:/var/run/docker.sock
