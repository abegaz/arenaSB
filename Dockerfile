FROM httpd

COPY ./index.htm htdocs/index.html
EXPOSE 80

