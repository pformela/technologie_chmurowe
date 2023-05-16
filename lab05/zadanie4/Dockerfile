FROM alpine
ARG PYTHON_VERSION=3.9.6
ARG PORT=4000
ENV PYTHON_VERSION=${PYTHON_VERSION}
ENV PORT=${PORT}

WORKDIR /app

RUN apk add --no-cache python3=${PYTHON_VERSION}-r0
RUN echo "Python version: ${PYTHON_VERSION}" > /app/index.html
RUN echo "Port: ${PORT}" >> /app/index.html

EXPOSE $PORT
CMD python3 -m http.server $PORT