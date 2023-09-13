# git clone https://github.com/pekaboo/yqfcn.com.git
APP_NAME=html
APP_TAG=latest
# HARBOR_PREFIX=harbor.j-net.cn/jnet-mall
HARBOR_PREFIX=yqfcn

docker ps -a
docker image rm -f ${HARBOR_PREFIX}/${APP_NAME}:${APP_TAG}
# docker pull ${HARBOR_PREFIX}/${APP_NAME}:${APP_TAG}
docker build -t ${HARBOR_PREFIX}/${APP_NAME}:${APP_TAG} .
docker container rm -f ${APP_NAME}

docker run \
-it -d \
--restart=always \
--name jnet-mall-${APP_NAME} \
--log-opt max-size=10m \
--log-opt max-file=5 \
-e TZ=Asia/Shanghai \
-e SPRING_PROFILES_ACTIVE=prod \
-e SPRING_OUTPUT_ANSI_ENABLED=NEVER \
-p 8084:8080 \
${HARBOR_PREFIX}/${APP_NAME}:${APP_TAG}

docker ps -l --no-trunc
