FROM python

WORKDIR /app

RUN apt update -y &&\
    apt install -y build-essential python-dev

COPY requirements.txt .

RUN pip install -r requirements.txt

COPY . .

EXPOSE 8000

WORKDIR /app/qa_api

CMD [ "gunicorn", "--reload", "-b 0.0.0.0:8000", "qa_api:api"]