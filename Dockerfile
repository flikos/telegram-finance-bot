FROM python


ENV TELEGRAM_API_TOKEN="1659670800:AAEkkwUPtj8W07RcFH1sxI9rqnJyrEzgdxQ"
ENV TELEGRAM_ACCESS_ID="1028527776"
ENV TELEGRAM_PROXY_URL=""
ENV TELEGRAM_PROXY_LOGIN=""
ENV TELEGRAM_PROXY_PASSWORD=""

ENV TZ=Europe/Moscow
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get install -y sqlite3 libsqlite3-dev

WORKDIR /home

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY *.py ./
COPY createdb.sql ./

ENTRYPOINT ["python", "server.py"]

