# ��������������ܵ�ǰ�ľ��񣬼��þ�����һ���Ӿ�����Ҫһ���������������
FROM alpine:3.5

# ��װpython��pip
RUN apk add --update py2-pip

# ��װPythonӦ�������ģ��
COPY flask-app/requirements.txt /usr/src/app/flask-app/
RUN pip install --no-cache-dir -r /usr/src/app/flask-app/requirements.txt

# ����Ӧ�ñ�����ļ�
COPY flask-app/app.py /usr/src/app/flask-app/
COPY flask-app/templates/index.html /usr/src/app/flask-app/templates/

# ���ñ�¶�Ķ˿ں�
EXPOSE 5000

# ����Ӧ�õ�����
CMD ["python", "/usr/src/app/flask-app/app.py"]