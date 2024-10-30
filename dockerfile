# Dockerfile de test
FROM alpine:latest
RUN echo "Hello, world!" > /hello.txt
CMD ["cat", "/hello.txt"]
