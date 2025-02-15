FROM nginx:latest
RUN apt-get update && apt-get upgrade -y
RUN apt-get install wget unzip -y
WORKDIR /usr/share/nginx/html
COPY default.conf /etc/nginx/sites-enabled/
ADD https://bootstrapmade.com/content/templatefiles/Yummy/Yummy.zip .
RUN unzip Yummy.zip
RUN mv Yummy/* .
RUN rm -rf yummy Yummy.zip
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
