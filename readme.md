#Заготовка для php проектов в докере    
http://localhost/
## docker env 
https://docs.docker.com/compose/env-file/   


### запуск стоп
make up  /  make down

### install laravel
make cli
REMOVE public FOLDER    rm -rf public
composer create-project laravel/laravel .
chmod  -R 777 storage/


### in terminal
sudo chown sam *   ///    whoami
or
sudo chown "$USER" *

### для php 7.2 
добавить
RUN pecl install mcrypt
RUN docker-php-ext-enable mcrypt
###    тунелировани
https://localtunnel.github.io/ww
