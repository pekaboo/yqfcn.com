FROM harbor.j-net.cn/wms/nginx
RUN mkdir /app
# COPY  /dist /app
COPY  / /app
COPY /dist/nginx.conf /etc/nginx/nginx.conf