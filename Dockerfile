FROM golang:1.23-alpine as build
WORKDIR /app
COPY . .
RUN go build -o cookies .

FROM alpine:latest
WORKDIR /root/
COPY --from=build /app/cookies .
EXPOSE 8080
CMD ["./cookies"]
