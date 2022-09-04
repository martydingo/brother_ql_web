FROM python:latest
SHELL [ "/bin/bash", "-c" ]
USER root
RUN mkdir /app
COPY requirements.txt brother_ql_web.py font_helpers.py config.example.json app/
RUN mkdir /app/static
COPY static app/static
RUN mkdir /app/views
COPY views app/views
RUN pip3 install -r /app/requirements.txt
RUN mkdir /config
COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT [ "/bin/bash", "-c"]
CMD [ "/entrypoint.sh" ]