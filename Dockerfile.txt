FROM alpine

RUN apk add --no-cache curl unzip

WORKDIR /app

COPY pocketbase /app/pocketbase
COPY pb_data /app/pb_data

EXPOSE 8090

CMD ["./pocketbase", "serve", "--http=0.0.0.0:8090"]
