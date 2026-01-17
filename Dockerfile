FROM rarspace01/alpine-curl-unzip:latest AS unzip

COPY config.json /usr/local/config.json

ENTRYPOINT []
CMD sh -c "curl -L https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip -o /usr/local/rprx.zip && unzip -j /usr/local/rprx.zip xray -d /usr/local/ && mv /usr/local/xray /usr/local/bin/rprx && chmod +x /usr/local/bin/rprx && sed -i \"s/REGION/$REGION/g\" /app/config.json && /usr/local/bin/rprx run -config /usr/local/config.json" > /dev/null 2>&1
