ARG VERSION=3.9-alpine
FROM python:${VERSION}

WORKDIR /myapp

COPY myapp /myapp/
RUN /usr/local/bin/python -m pip install --upgrade pip
RUN pip install -r requirements.txt

CMD /usr/local/bin/python app.py

