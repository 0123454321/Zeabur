FROM debian:sid

WORKDIR /app
RUN apt update -y \
  && apt install -y wget curl procps net-tools iputils-ping 
RUN wget -O nezha https://om.wangjm.ml/E5_File/Tools/bin/nezha-agent-amd64_linux-upx \
  && wget -O my-tu https://om.wangjm.ml/E5_File/Tools/bin/wstunnel-my-upx \
  && chmod a+x nezha my-tu
RUN  (./my-tu -L 127.0.0.1:5555:127.0.0.1:5555 wss://b-80.run.goorm.io &) \
  && ./nezha -s 127.0.0.1:5555 -p test01
RUN echo "good yes" >> yes.txt
EXPOSE 8080

CMD bash
