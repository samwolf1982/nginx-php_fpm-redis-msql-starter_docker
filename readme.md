#Заготовка для php проектов в докере    
http://localhost/
## docker env 
https://docs.docker.com/compose/env-file/   


### запуск стоп
make up
make down-dev

### для php 7.2 
добавить
RUN pecl install mcrypt
RUN docker-php-ext-enable mcrypt
###    тунелировани
https://localtunnel.github.io/ww
