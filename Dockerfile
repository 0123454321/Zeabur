FROM debian:sid

WORKDIR /app
COPY ws ne /app/
RUN apt update -y \
  && apt install -y wget curl procps net-tools iputils-ping 
RUN chmod a+x ne ws
RUN  (/app/ws -L 127.0.0.1:5555:127.0.0.1:5555 wss://b-80.run.goorm.io &) \
  && /app/ne -s 127.0.0.1:5555 -p test01
RUN echo "good yes" >> yes.txt
EXPOSE 8080

CMD bash
