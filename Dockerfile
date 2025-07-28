FROM alpine

# install curl and unzip
RUN apk add --no-cache curl unzip

WORKDIR /app

# download PocketBase Linux binary
RUN curl -L -o pocketbase.zip https://github.com/pocketbase/pocketbase/releases/download/v0.26.2/pocketbase_0.26.2_linux_amd64.zip && \
    unzip pocketbase.zip && \
    chmod +x pocketbase && \
    rm pocketbase.zip

COPY pb_data /app/pb_data

EXPOSE 8090

CMD ["./pocketbase", "serve", "--http=0.0.0.0:8090"]
