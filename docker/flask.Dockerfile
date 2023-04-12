FROM python:3.11-alpine

WORKDIR /usr/src/app

COPY ./requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY ./app .

ENV FLASK_APP=app.py
# watch app' files
ENV FLASK_DEBUG=true
ENV FLASK_ENV=development

# running Flask as a module
CMD ["sh", "-c", "sleep 5 \ 
    && flask db init \ 
    && flask db migrate \
    && flask db upgrade \ 
    && python -m flask run --host=0.0.0.0"]