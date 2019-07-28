server {
    server_name  www.najeeebassociates.eygert.com;
    rewrite ^/(.*) http://najeeebassociates.eygert.com/$1 permanent;

}

server {
    server_name najeeebassociates.eygert.com;

    access_log /var/www/najeeebassociates/logs/access.log;
    error_log /var/www/najeeebassociates/logs/error.log;

    location / {
        root   /var/www/najeeebassociates/;
        index  index.html;
    }
    location /explorer/ {
        proxy_set_header HOST $host;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_pass http://localhost:3030/explorer/;
    }
    location /api/ {
        proxy_buffer_size 128k;
        proxy_buffers 4 256k;
        proxy_busy_buffers_size 256k;
        proxy_set_header HOST $host;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_pass http://localhost:3030/api/;
    }
}