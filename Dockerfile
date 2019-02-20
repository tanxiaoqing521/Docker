# 利用这个镜像来跑当前的镜像，即该镜像是一个子镜像，需要一个大的容器才能跑
FROM alpine:3.5

# 安装python和pip
RUN apk add --update py2-pip

# 安装Python应用所需的模块
COPY flask-app/requirements.txt /usr/src/app/flask-app/
RUN pip install --no-cache-dir -r /usr/src/app/flask-app/requirements.txt

# 复制应用必须的文件
COPY flask-app/app.py /usr/src/app/flask-app/
COPY flask-app/templates/index.html /usr/src/app/flask-app/templates/

# 设置暴露的端口号
EXPOSE 5000

# 设置应用的启动
CMD ["python", "/usr/src/app/flask-app/app.py"]