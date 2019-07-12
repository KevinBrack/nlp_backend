FROM python

WORKDIR /app

RUN apt update -y &&\
    apt install -y build-essential python-dev

COPY requirements.txt .

RUN pip install -r requirements.txt

RUN python3 -m spacy download en

COPY . .

EXPOSE 8000

WORKDIR /app

CMD [ "gunicorn", "--reload", "-b 0.0.0.0:8000", "qa_api/qa_api:api"]
# CMD [ "gunicorn", "--reload", "--timeout 120", "--workers 2", "--worker-class gevent", "-b 0.0.0.0:8000", "qa_api:api"]