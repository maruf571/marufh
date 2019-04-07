FROM nginx:alpine
COPY etc/nginx/nginx.conf /etc/nginx/nginx.conf
WORKDIR /usr/share/nginx/html
COPY index.html .
