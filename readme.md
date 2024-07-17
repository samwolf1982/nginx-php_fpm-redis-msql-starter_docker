### Moscovia is state of terrorism  
#Заготовка для web додатків на базі php node   
http://localhost/
## docker env 
https://docs.docker.com/compose/env-file/   


### запуск, зупинка проєкта
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
добавити
RUN pecl install mcrypt
RUN docker-php-ext-enable mcrypt
###    тунель
https://localtunnel.github.io/ww
