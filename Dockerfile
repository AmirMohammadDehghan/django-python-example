FROM python:3

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

ADD . /usr/src/app

WORKDIR /usr/src/app

COPY requirements.txt ./

RUN pip3 install --upgrade pip
RUN pip3 install -r requirements.txt

CMD gunicorn django_app.wsgi:application --bind 0.0.0.0:8000

EXPOSE 8000
